package com.example.lexiconGenTemplates;

import com.modelsolv.reprezen.generators.api.GenerationException;
import com.modelsolv.reprezen.generators.api.zenmodel.ZenModelGenTemplate;

public class LexiconGenTemplatesGenTemplate extends ZenModelGenTemplate {

	@Override
	public String getName() {
		return "LexiconGenTemplates";
	}

	@Override
	public String getId() {
		return "com.example.lexiconGenTemplates.LexiconGenTemplatesGenTemplate";
	}

	@Override
	public void configure() throws GenerationException {
		defineZenModelSource();
		define(outputItem().named("main") //
				.using(MainGenerator.class) //
				.writing("${zenModel.name}.csv"));
	}
}
