Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B234433105
	for <lists+linux-doc@lfdr.de>; Tue, 19 Oct 2021 10:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbhJSI0v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 04:26:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35682
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234699AbhJSI0u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 04:26:50 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 94EB33FFF1
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634631877;
        bh=Swi6Ddj8Xbp80QnpAWQNLdENzfNBX7zxXSg0uNaLjZ4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=cCepZ2ALvBtLCAT3rf4ecpyPBaK0qnqF8X8A4aKwj3hC5XX2bgfMLNt1+LR/D7PzT
         ZsFAOeneKYSpuZKXuXIDU965fjBhfxTWLM4aZFzPswBIuCqIF1FKfaQ8trNLRa7kfH
         I2N4RpUVU/WLojDR2GffzcHnrz1Bd+581/iEYCu2OA5tuxwYIwHe/YljHCFZUyLC9J
         JY0b4tOVoiBIDRkZ5q2r/Ff87cL/h6LdpLch2f8/nJ5J+dfriAI0a4YjpC/rL+tpwA
         wyXB5w3GS0/JQh5EEQcbyliI+1U2s2zmyjQUJhThAbcWL3vernjSgsUbDPahACYPgy
         9poyU8hLddm5A==
Received: by mail-lj1-f198.google.com with SMTP id o4-20020a2ebd84000000b00210ae894d18so598469ljq.13
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Swi6Ddj8Xbp80QnpAWQNLdENzfNBX7zxXSg0uNaLjZ4=;
        b=kgaKl0th97tovWFxsFX3ABz1C9PN1lJYWSoDM2jPUBRg73SiWxf/xuytSr9e+IK+ap
         jRcp4hiH4mWYTkdLFOXedjEckqr8duQgz2eNp5e4+SgNH619tIWgBbTp/mVRPhPRrIvu
         a9IwRb0nd4TBcGEZQciJg+Lc9BKYaZ2F+ex1rlvIvM6Cmy+XFroAJyCWBW104IqCZsnu
         9bnfddwqOKM/aH+A0lkJmSgVf4UpWqiXt8DtVZQNFSPrUPstk/M2yuX+iYXdiDKPru3Q
         l8LCHroR4dc+vn2fi4dG/xxIHA4FV5muh5VSNeHyIh49g9XIAVVUTlZrfvQH4YtUA5VN
         8g2w==
X-Gm-Message-State: AOAM533oWhsUwa3sJ2zH7bETn7YWgVAOveEwf0/6wYo7PHIQq5iFztW+
        bYgrM0jHc8hCbDsoKz59XCrTfSXmD3oGhmVIYAjnsBH19x6/tOPug1UIv4XKVK1oEH0pJdsgwTV
        QjJULSh02SPuy+gpdwdjqHLs3nFv6IOOteWNN5g==
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr5094990lji.445.1634631876046;
        Tue, 19 Oct 2021 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/kAZBOxkypgv+WhYfxmIUQ9Io7rvWQf5Awb9V5Is54av5KHbiCRs1Zw9l65qYqDA79/DqWA==
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr5094971lji.445.1634631875874;
        Tue, 19 Oct 2021 01:24:35 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b43sm822485ljr.17.2021.10.19.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:24:35 -0700 (PDT)
Subject: Re: [PATCH v3 22/23] regulator: dt-bindings: update
 samsung,s5m8767.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <63f3ac8bc958d65e4f31ad4a0060c21a7038cbde.1634630486.git.mchehab+huawei@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ac1445ce-8b60-c772-4c61-7cdfb8fe6ec6@canonical.com>
Date:   Tue, 19 Oct 2021 10:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <63f3ac8bc958d65e4f31ad4a0060c21a7038cbde.1634630486.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/10/2021 10:04, Mauro Carvalho Chehab wrote:
> The file name: Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> should be, instead: Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: fab58debc137 ("regulator: dt-bindings: samsung,s5m8767: convert to dtschema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
> 
>  .../devicetree/bindings/regulator/samsung,s5m8767.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> index 80a63d47790a..4281f670c775 100644
> --- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> @@ -15,7 +15,7 @@ description: |
>  
>    The S5M8767 provides buck and LDO regulators.
>  
> -  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
> +  See also Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml for
>    additional information and example.
>  
>  patternProperties:
> 


Hi Mauro,

Thanks for the patch but it is incorrect. Old path is proper, just the
patch waits on merging.

For this one: NAK.

Best regards,
Krzysztof
