Return-Path: <linux-doc+bounces-1167-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A47457D7BF3
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 07:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA00281DF3
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 05:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1746DC128;
	Thu, 26 Oct 2023 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiS5Ik5Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0577488
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 05:01:33 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A2293;
	Wed, 25 Oct 2023 22:01:31 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so324439276.1;
        Wed, 25 Oct 2023 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698296491; x=1698901291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3AT7KXQGUsciZNpjF//+rR7xY7+/xeq6fT/G1a+QH3A=;
        b=aiS5Ik5YTkEi1waW3nF1plYmh7BLMv9EMEHGW34h0w1XCXDqRAH5Z1yGyNF27/3ndg
         Nbm5WrS/R3XAUX9fNsuCzJ337lfk4yG7GI4qbji+c8F4U6PCwazoUuu11690Q1ZeytNC
         /Xzuvcem8brz/kJVphupyfJE0e0ohs0rPiA44PWoPAGd7/Ew3Sh1+WcwPuhwHU1N9W31
         UN8EV9z4UbeA4gZsq5iw4QDBtPygs33kGCCCszU6st/3BORUaWudb56ZK9pukbXljfqF
         hNkV5onZ9FV51IV96QxILwNVPNncNY1ZSJDkxub9bENhPoXJbgOi67+8GZB4IRHaH74k
         wLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698296491; x=1698901291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AT7KXQGUsciZNpjF//+rR7xY7+/xeq6fT/G1a+QH3A=;
        b=Nzxt7LVDOg4AdgutQS/96Bjao+9r9DJi4jeByrqNMIht2kS/eQ2YYo4rKFHs26cwB1
         hCXrrmALVIaxslJ9OHzywyZLS/qCLE/QmHeW5BLZ2CCZjBLsIo0wxtCDVsfQb0zf2LGo
         7i2Y43R1tvJ1SLlPrPv1ACSLxc9xnBwcanVVTeSbMhHjE3lCP19mIBv5vVn+cZbb6qgT
         6Bvgd08Xr7nGtgwKFQXxTOjfZWzcZT9a63tDyRzjmQyLQBc/KIPSn0Zq8nKv6/uuJot2
         4F0yBUtCY1fjWpwF5WifP6giF4hDwaEMKRJLio4Jl9Ud/b0ioSnHH3o6p4FuHpn0CNox
         BTmA==
X-Gm-Message-State: AOJu0YwgET9Tbf6q5DDTAkBx0HkiXQ7Dr8rf7i0niuAzGSmbse1U34nB
	XVsSslRRjPGugnKQFv2e4g4=
X-Google-Smtp-Source: AGHT+IHYLLogG8ok5wIpCRoGQhAZePmymJghIRX0SagV0FJqYysItuPn8cBQLmJQJHwivRTvpQ+6Cg==
X-Received: by 2002:a25:d00c:0:b0:d9a:55e5:9a0c with SMTP id h12-20020a25d00c000000b00d9a55e59a0cmr15616304ybg.26.1698296490725;
        Wed, 25 Oct 2023 22:01:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ch20-20020a0569020b1400b00da086d6921fsm834090ybb.50.2023.10.25.22.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 22:01:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a8fd5d6-9b79-76de-80fe-b39e24510dec@roeck-us.net>
Date: Wed, 25 Oct 2023 22:01:28 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.
Content-Language: en-US
To: Ellie Hermaszewska <kernel@monoid.al>
Cc: eugene.shalygin@gmail.com, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAB95QAR-UbfVULOCaZMO4H1AgvzbiHEoSYk-DiYPY6Pg-i7Vag@mail.gmail.com>
 <20231019135640.434752-1-kernel@monoid.al>
 <d013e9a3-df0a-4b8f-a1f3-db3cbd32812f@roeck-us.net>
 <b81ae275-d3ac-4565-a09a-4a5ce38fadf1@monoid.al>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b81ae275-d3ac-4565-a09a-4a5ce38fadf1@monoid.al>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/23 21:46, Ellie Hermaszewska wrote:
> On 10/26/23 03:35, Guenter Roeck wrote:
>  > This is not an acceptable commit description.
> 
> This is not acceptable feedback.
> 
> I am unable to accept it because it is not clear to me what you think
> should be changed.
> 
> Is it because I misplaced the message to Eugene? Is it because of the
> Greek characters? Is is not descriptive enough of the change, or in the
> wrong tense, or has incorrect punctuation? Do I need to include my
> testing methodology?
> 
> If it's only something minor, then please also feel free to correct it
> yourself before applying. If you can't or it's not something minor,
> then please let me know what ought to change and I can try to correct it.
> 
> If you don't let me know, then I will have to guess and possibly waste everyone's time further.
> 

Please consider reading and following the directions in
Documentation/process/submitting-patches.rst.

Thanks,
Guenter


