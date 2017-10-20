#!/bin/bash

## 全局变量 ##

# CentOS 版本
centos_release="${1}"

# MySQL 版本
mysql_version="${2}"

# 源安装文件名
repo_file_name=""

# 源安装文件下载地址
repo_file_url=""

# 源安装文件保存路径
repo_file_path=""

# 根据 CentOS 版本确定源安装文件名
function set_repo_file_name() {
    case "${centos_release}" in
        "centos6")
            repo_file_name="mysql57-community-release-el6-11.noarch.rpm"
            ;;
        "centos7")
            repo_file_name="mysql57-community-release-el7-11.noarch.rpm"
            ;;
    esac
    
    repo_file_url="https://repo.mysql.com/${repo_file_name}"
    repo_file_path="/tmp/${repo_file_name}"
}

# 下载源安装文件
function download_repo_file() {
    # 如果源安装文件已经存在则删除
    if [ -e "${repo_file_path}" ]
    then
        rm -f "${repo_file_path}"
    fi
    wget -O "${repo_file_path}" "${repo_file_url}"
}

# 安装 MySQL
function install_mysql() {
    # 安装源配置文件
    rpm -Uvh "${repo_file_path}"
    
    # 配置软件源
    yum install yum-utils -y
    case "${mysql_version}" in
        "mysql56")
            yum-config-manager --enable mysql56-community
            yum-config-manager --disable mysql57-community
            ;;
        "mysql57")
            yum-config-manager --enable mysql57-community
            yum-config-manager --disable mysql56-community
            ;;
    esac
    
    yum install mysql-community-server -y
}

# 打印脚本的使用方法
function print_usage() {
    echo "脚本的使用方法：./${0} {centos6|centos7} {mysql56|mysql57}"
}

# 脚本主函数
function main() {
    if [ "${centos_release}" == "centos6" -o "${centos_release}" == "centos7" ]
    then
        # 确定源安装文件名
        set_repo_file_name
        if [ "${mysql_version}" == "mysql56" -o "${mysql_version}" == "mysql57" ]
        then
            download_repo_file
            install_mysql
        else
            echo "参数错误：MySQL 版本错误"
            print_usage
        fi
    else
        echo "参数错误：CentOS 版本错误"
        print_usage
    fi
}

main
