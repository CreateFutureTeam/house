package com.offcn.house.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.core.convert.converter.Converter;
//全局的时间转换器
//好处，不用每个时间属性都附加一个属性
public class DateConverter implements Converter<String,Date> {

	public Date convert(String source) {
		//正常情况时yyyy-MM-dd
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
		//如果有特殊情况下
		if(source.contains("/")){
			dataFormat = new SimpleDateFormat("yyyy/MM/dd");
			try {
				return dataFormat.parse(source);
			} catch (ParseException e){
				e.printStackTrace();
			}
		}else if(source.contains("-")){
			try {
				return dataFormat.parse(source);
			} catch (ParseException e){
				e.printStackTrace();
			}
		}
		
			return null;
	}

}
