Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474A819E410
	for <lists+linux-doc@lfdr.de>; Sat,  4 Apr 2020 11:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgDDJWi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 4 Apr 2020 05:22:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38134 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgDDJWi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Apr 2020 05:22:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id f20so1322181wmh.3
        for <linux-doc@vger.kernel.org>; Sat, 04 Apr 2020 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VaZ61SKUHp7an+3kDV0hcVK7pcsS2BDQgBYtbRGo0Ao=;
        b=NJitEaM1WiqcZpIHhZWB/JObWP47Di3prSuIuSIPejCSNN3QAqLmhfE61pzotYEY8x
         oJ4l5GOt4jKn62/YWedpAnJLqG6CEFVdFJGyRSGi0riMYS2mrLdvJJtJlXTtN+p188is
         JTQpCdffTxuX/JI0sQ5tAqoWgmgIZONOTmsuFYcf3/3TXJeBEr++B0awUpew/4rCHfQu
         hW6o1N53cYfbRCNMWF29WaWSS5KtgjDYSi+rI5k+wdSAUaTGM1jcp1QRQjmIcpodvwWQ
         opB7VkF3zWSSe+tPQGh4gBoKSoDoaFOJQPLeHTJ03Su1kbc7gIqROKRPWm56VdjhrGQg
         ZYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VaZ61SKUHp7an+3kDV0hcVK7pcsS2BDQgBYtbRGo0Ao=;
        b=ipShRJWurHfsEceMhzEbA5LM+WB6pnrj4fy+7Fqpv2tSYWWbspTp6NrqbTFppG6nfw
         4kbz+Nl4SzKC2EEo8xbfm5v1F2WdmhfL4X5cCDRxViCXlQnmv4UnEVzk5HrynxKpY+Wi
         EDs2y91CGWklCNN/OpLrXSdz0WezWLfP+3Umb3/nQapJ5hpBmtPsIONgRhugO/qvX7HY
         QxrJep8R8FTViqksQ0KA7XORTO01l2CGZk2ZNkKyYOf9dVtdyTjyXBornIkBDxvNwvwD
         A4cFLB4wvU3iVxctqwG7ix6jZw1BmMBj7p9/Lrdxu5TJdgTfN1HUh9XYLrLlMnrckvQb
         RqYg==
X-Gm-Message-State: AGi0PuYePBXSgPa9uLNwF/7gVpw/jF8idFfSKunI6wAlV7HVpXWH3qKH
        TK4v1LeXzOGgM7/iYWnZDHAHKmNlfJo=
X-Google-Smtp-Source: APiQypLMMEINjoXwAvx3i+IZSgz1cEqky5zi+EArYlzMxHvOb5JG39Y6+gxwHT0+fxVDME/DCELsHw==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr12936275wmc.32.1585992153686;
        Sat, 04 Apr 2020 02:22:33 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:b929:c9ac:10ec:b646? ([2a01:e34:ed2f:f020:b929:c9ac:10ec:b646])
        by smtp.googlemail.com with ESMTPSA id p17sm14720153wmb.30.2020.04.04.02.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2020 02:22:33 -0700 (PDT)
Subject: Re: [PATCH] Documentation: cpu-idle-cooling: fix diagram for 33% duty
 cycle
To:     Sergey Vidishev <sergeyv@yandex-team.ru>,
        linux-kernel@vger.kernel.org
Cc:     trivial@kernel.org, Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Javi Merino <javi.merino@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <2374188.AZIXMmL6Zy@sergeyv-box>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <525c21fd-f89d-97aa-2dc8-05f9bf4f51e2@linaro.org>
Date:   Sat, 4 Apr 2020 11:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2374188.AZIXMmL6Zy@sergeyv-box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/04/2020 21:12, Sergey Vidishev wrote:
> Signed-off-by: Sergey Vidishev <sergeyv@yandex-team.ru>

Applied, thanks

> --- Documentation/driver-api/thermal/cpu-idle-cooling.rst | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/thermal/cpu-idle-cooling.rst
> b/ Documentation/driver-api/thermal/cpu-idle-cooling.rst index
> 9f0016ee4cfb..a1c3edecae00 100644 ---
> a/Documentation/driver-api/thermal/cpu-idle-cooling.rst +++
> b/Documentation/driver-api/thermal/cpu-idle-cooling.rst @@ -95,28
> +95,28 @@ and this variation will modulate the cooling effect.
>
> ::
>
> ^ | | |-------                 -------
> |_______|_______________|_______|___________
>
> <------> idle  <--------------> running
>
> -      <-----------------------------> -              duty cycle
> 33% +      <---------------------> +          duty cycle 33%
>
>
> ^ | | |-------         -------
> |_______|_______|_______|___________
>
> <------> idle  <------> running
>
> <------------->
>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
