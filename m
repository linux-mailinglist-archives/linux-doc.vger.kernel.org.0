Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E365F21D3
	for <lists+linux-doc@lfdr.de>; Sun,  2 Oct 2022 09:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiJBH6f (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 2 Oct 2022 03:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiJBH6a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Oct 2022 03:58:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E4E5005F
        for <linux-doc@vger.kernel.org>; Sun,  2 Oct 2022 00:58:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b2so1731082lfp.6
        for <linux-doc@vger.kernel.org>; Sun, 02 Oct 2022 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kBWjRRTovg35zU7EoEfXokWME2W+wlj8Ua14x5ihi7Y=;
        b=zyr3igGdKkgtXY2NI1R+geCbdPTB5GIlHOrot9oUVQg73KMxt1Mc+92vJ9/Nrj30qv
         CpGEhMcfLc2uDsMUYyeohKJWyu0FY38AsRUBzL/BOn5Uh5ZzQTQpvUG3ZTf8cDNTpFqd
         fg+XR05rAeyuUkB18mySzUQ5DfINVLmyzfwirDaujWOkj0DEbbiMldIzZdelANyLfeRz
         iyQbMTGMZDsEINU+046V3a3QU6bUj0nQtIQJyMRbjoo61NeWb0SEY80ZfGEzeW9vWaHa
         nWWNYBg88hwfxR9nlvtm6hR7FB4dmcHkE5wh7tmmnPQElTvsJlCgC+l/VWWc+JZYFZBH
         UlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kBWjRRTovg35zU7EoEfXokWME2W+wlj8Ua14x5ihi7Y=;
        b=6DvEUV8266xkr1XDIUm9tkBThgCBv/TCXxUanh30K+DUyBlRLZDxqq/reQQC04N/4m
         YALsLvBTHRSaaakfqIWhdjbPfuFSDj58lkCSnk6Ue6Aiea4dt6rM5OzsuxdaSPc8o2BI
         ySkbvZnXMaVVhEFFyf7XvpM2fw59LZNP5S7A54AegvFmUeoTTcMvH9huSkN7KgHWg8F5
         z3jl6l72IWJiat8Q0rEI0Uph6DfCmTYf5mU0Pzb8dM7DfEL5T94uHJdYATNvtq47MYsG
         r3mLNRPGWJ/w2CE3IhyYTntXUoK5CUWtOvDop1n4nJliQ/IRx/dfpDRi+LWcox92512r
         qzaw==
X-Gm-Message-State: ACrzQf3FYhJJvn6OV7onXPJIOezbQDoYJbozgaDqWpV7rP6KEbMHBkUS
        XKn+ZeKPF8v+9odeMKrI9O6tTQ==
X-Google-Smtp-Source: AMsMyM4FWf0nZksW2rIlXQIcJ+DVvjaAGqFh0bmPFJ0z0J26jfQ9VS8bhfx6FvMQz7EEEi1Cn948JA==
X-Received: by 2002:a05:6512:280c:b0:4a1:e1e7:4455 with SMTP id cf12-20020a056512280c00b004a1e1e74455mr6275422lfb.217.1664697507392;
        Sun, 02 Oct 2022 00:58:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be43-20020a056512252b00b004994117b0fdsm998862lfb.281.2022.10.02.00.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 00:58:26 -0700 (PDT)
Message-ID: <dabbb4aa-d5e1-10d5-082c-1386f3314fc8@linaro.org>
Date:   Sun, 2 Oct 2022 09:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Theodore Ts'o <tytso@mit.edu>
Cc:     Akira Yokosawa <akiyks@gmail.com>, corbet@lwn.net,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@leemhuis.info
References: <20220930064629.329514-2-bryan.odonoghue@linaro.org>
 <21f8d79a-0ad4-b28b-15d8-f4be0cfd9730@gmail.com>
 <b119fee5-807f-1940-3378-f5ad638794f5@linaro.org> <Yzen4X1Na0MKXHs9@mit.edu>
 <70759d05-2646-57e5-0b87-3a196488f622@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <70759d05-2646-57e5-0b87-3a196488f622@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/10/2022 12:37, Bryan O'Donoghue wrote:
> 
> I wasn't sure how people would necessarily feel about having 
> get_maintainer produce the string 'maintainer' for both Maintained and 
> Supported but, IMO it is more consistent to have it do so, since we 
> refer to maintainers all throughout the doucmentation and as you say 
> above Rafael is the person you *need* to mail there because he's the 
> maintainer.
> 
> Lets consider
> 
> - maintainer as a string for "S: Supported"
> - Documentation update to reflect Krzysztof's point on git-fallback

Just to clarify my point - one can use git-fallback. The expectation is
however that submitter CCs all specifically assigned addresses from
maintainers, this is:
 - all maintainers
 - all maintainers-supporters
 - all reviewers
 - all dedicated mailing lists
 - LKML if there is no dedicated mailing list.

The easiest to achieve it is to run with --no-git-fallback and CC entire
output. However it does not mean submitter must run with
--no-git-fallback. It is only for this generic rule - CC entire output
of get_maintainers.pl.

If you add such rule "CC entire output of get_maintainers.pl" and do not
mention no-git-fallback, some folks will think they need to CC all these
people who made one commit to your file...

Best regards,
Krzysztof

