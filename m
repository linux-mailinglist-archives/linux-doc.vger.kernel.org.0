Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455182B0401
	for <lists+linux-doc@lfdr.de>; Thu, 12 Nov 2020 12:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgKLLfy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Nov 2020 06:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbgKLLfv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 06:35:51 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD117C0613D1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 03:35:50 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id j7so5658713wrp.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 03:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6kX+loQUX2nlBfS+5buxfWq+Q+8uXyy+I1jyDWpC3e4=;
        b=PmNtJ3wXgpASXov6BJvrQbnsWhusZLxlN6oclll6uTVQS5ITKM200U2nch/Sy3ktgf
         sdnPPoGK8Xtbbiz+QWmopjcppCX2CZHV/EZdvjFxIHupmbnF8SiRknQyNinBzD2DetWx
         jynbVCdm6kERPz9dL27eUMGxtm89Z3cG9fqARp4WObqNWnypEl0y2fKBdhxJ6ULOQ7ud
         b2KHBkSv/1Ho/QtO5YEIKcz3m76N9mSw2ENVzZwQ+sKjM0kFn/+M9d4QACupt0WTL2VB
         N4m/CdmouIXE+1zZNNZNYcqC2e+4E+qrBwlz5hzKo2KYr+ozqaL+uj2bSS50E/K0UlSs
         I1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6kX+loQUX2nlBfS+5buxfWq+Q+8uXyy+I1jyDWpC3e4=;
        b=TZHwAxpA7YPen0bhY3Jt32xWOlekErqkMvsS4Si3oKd2/iOXWqTWPSwHpkPpNUmVcR
         0AaVlOzgy/ve2DVPCdXdJZLwoKxK/nhJdv98nkAo8YMXztYqgDUEW1OoGXtqoxhfMohq
         VWgXKZ1tbBQe4cnWOyUbf4wz0fQ8k5OwsQw4vr0TAmAyEF6yAlpHIP8r6KPz2Y8bitkN
         5sTDLau9ZOndi7w3dWjcJIBbvRc7L05/LjPueOTLYB/5PuGiftFtGVZyeIe5yjei0DSZ
         5B/4Xu8mYOpMzJqWjBrTRX/CcKfQf04qkhZDwLjQkT2y7x/GacHCJpBq2TngFJOK5X0B
         APNQ==
X-Gm-Message-State: AOAM532aWU7FhxrQ8/JxCRY2HuRsKQU4khan572u5JXAgD+t4mB9Qs09
        c0bDS6niOgbGvl5HdD1wxO+MOw==
X-Google-Smtp-Source: ABdhPJwrrALrGgUNEDGn9ukK2Qm36it0tJOKswSURNCPWMICi+HDaTCBo+nX2wwG7CuTmsJdcZUf2Q==
X-Received: by 2002:adf:f808:: with SMTP id s8mr20534516wrp.257.1605180949580;
        Thu, 12 Nov 2020 03:35:49 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96? ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
        by smtp.googlemail.com with ESMTPSA id n14sm6132181wrt.8.2020.11.12.03.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 03:35:48 -0800 (PST)
Subject: Re: [PATCH] docs: thermal: time_in_state is displayed in msec and not
 usertime
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d5461bdf9ab6b6fee7f28f538582edbb426aa077.1605004905.git.viresh.kumar@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <cb6880c6-6729-e232-e4f3-28c165294e7a@linaro.org>
Date:   Thu, 12 Nov 2020 12:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5461bdf9ab6b6fee7f28f538582edbb426aa077.1605004905.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/11/2020 11:43, Viresh Kumar wrote:
> The sysfs stats for cooling devices shows the time_in_state in msec,
> remove the unwanted usertime comment.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
