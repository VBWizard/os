__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
    val[cnt]='\0';
    return val;
}
