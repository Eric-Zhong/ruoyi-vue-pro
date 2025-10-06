import subprocess

# 定义一个函数，用于执行cmd命令并获取输出
def execute_command(cmd):
    try:
        # 执行命令并捕获输出
        result = subprocess.check_output(cmd, shell=True, text=True)
        return result.strip()
    except subprocess.CalledProcessError as e:
        print(f"执行命令出错: {e}")
        return None

# 获取Java版本信息
def get_java_version():
    # 执行java --version命令
    output = execute_command("java --version")
    if output:
        # 分割输出为多行，并获取第一行
        # 通常Java版本信息的第一行包含主要版本信息
        lines = output.split('\n')
        if lines:
            return lines[0].strip()  # 返回第一行作为版本信息
    return None

# 主程序
def main():
    java_version = get_java_version()
    if java_version:
        print(java_version)
    else:
        print("无法获取Java版本信息")

if __name__ == "__main__":
    main()