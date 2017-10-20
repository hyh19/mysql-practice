#!/bin/bash

repo_file_6 = mysql57-community-release-el6-11.noarch.rpm

repo_file_7 = mysql57-community-release-el7-11.noarch.rpm

rpm -Uvh mysql57-community-release-el6-11.noarch.rpm

## 全局变量 ##

# CentOS 版本
centos_release="${1}"

# MySQL 版本
mysql_version="${2}"

# 源安装文件名
repo_file_name=""

# 源安装文件下载地址
repo_file_url="https://repo.mysql.com/#{repo_file_name}"

# 源安装文件保存路径
repo_file_path="/tmp/#{repo_file_name}"

# 下载源安装文件
function download_repo_file() {
	# 如果源安装文件已经存在则删除
	if [ -e "${repo_file_path}" ]
	then
		rm -f "${repo_file_path}"
	fi
	wget -O "${repo_file_path}" "${repo_file_url}"
}

# 安装源配置文件
function install_repo_file() {
	rpm -Uvh "${repo_file_path}"
}

# 配置软件源
function config_repo() {
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
}

# 安装 MySQL
function install_mysql() {
	yum install mysql-community-server -y
}

# 打印脚本的使用方法
function print_usage() {
	echo "脚本的使用方法：./${0} {6|7}"
}

if [ "${#}" -eq 1 ]
then
    case "${1}" in
		6|7)
            repo_file="mysql57-community-release-el#{1}-11.noarch.rpm"
            repo_url="https://repo.mysql.com/#{repo_file}"
            download_repo_file
            install_mysql
            exit 0
            ;;
        *)
            echo "错误：脚本参数不正确"
            print_usage
            exit 1
            ;;
    esac
else
    echo "错误：脚本参数的数量不正确"
    print_usage
    exit 1
fi
