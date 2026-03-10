package org.example.config;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.openai.OpenAiChatModel;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ClientConfig {

//    @Bean
//    @ConditionalOnMissingBean
//    public ChatClient chatClient(OllamaChatModel model){
//        return ChatClient.builder(model)
//                .defaultSystem("你是一名专业的机器人助手，名字叫团团，你需要专业且礼貌的回答用户的问题。")
//                .build();
//    }

    @Bean
    @ConditionalOnMissingBean
    public ChatClient chatClient(OpenAiChatModel model) {
        return ChatClient.builder(model)
                .defaultSystem("你是一名专业的机器人助手，名字叫团团，你需要专业且礼貌的回答用户的问题。")
                .build();
    }
}
