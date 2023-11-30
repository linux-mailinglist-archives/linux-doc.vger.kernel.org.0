Return-Path: <linux-doc+bounces-3582-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54677FE9C4
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 08:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49E40B20DAE
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 07:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B061F934;
	Thu, 30 Nov 2023 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keGMdGID"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB498B9;
	Wed, 29 Nov 2023 23:34:00 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cf8e569c35so5927645ad.0;
        Wed, 29 Nov 2023 23:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701329640; x=1701934440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3mnK86zS9kgkKOxmm/9KwAlPUykH+ThgLDfr/k2vMa8=;
        b=keGMdGID7pcMfKzk3mefpVaDWSUQsqqMEHN1h8EOvxmS3Zqcq4PBkskdzOPr1ybNi7
         GqoLSA+AMqAYGEMcYE8h0BM3m0xPBiW/hLZfHB6tdK8ktnakLHysHKrFuXRcvySUXCYv
         s4MjsyV1HKnY/lg+jHjJ3z0jzmMnIun4pPyIaGEcClBoPhQNDBHSBcg+PMztaod8/z8i
         Cs1m5BgjcQ3/5kyJO29IKOBbQNpauITr+urZH3PyVziog4uYdEUwmoQOGGDAnyh32aij
         Yc84yghwLO86r3z5cbm+hNxLPIMb3CqFoHdi7lWRAeC50UyPSLELJ980FrwPsGgqNvXw
         OplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329640; x=1701934440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3mnK86zS9kgkKOxmm/9KwAlPUykH+ThgLDfr/k2vMa8=;
        b=v7oKB37/sDAWpfUYtec057MmUCO7nam6BAx6rTiLySwb3QLY/hdrVirvjTmHbjZO66
         FSQBML5ryIErZjz4XlIwZFV+c07P91/EZjU5ztdGle9c7+a0lyOb2UEuC/+QlECZyfRh
         YtRkwycp6enFMfaXAwo/h0av8+4cC0F79RImB4vW2H7uKNIPHt2NIE90N2Q6i7LkllQ2
         zo6w3BVf9XS3qgjDBBDbT3UE5cCgBErjxUnVvgZ8ETams9P4GNyYaHd4tV3D76PdX+4J
         cBP+TQ0/L97T410IwbyTRjXZ/k0pmXGNE5kLLFP9Aj3l6997lbfydu/sBpApzmusXHAH
         C1Ag==
X-Gm-Message-State: AOJu0YzbQf46BiTajrrNBZEk5qVxoY5xlUjhE2ACoGQrrc2NC6MHmX3Q
	aAa4BHhOKgPJUIC0douOjKaPxuCA/uk+Mw==
X-Google-Smtp-Source: AGHT+IHudgUyHU7NAs9q70jlysfskaogusgM3hhNgTORctTs9pQLzQLv8sy/F+dxr8fk7Rg0ZeBhow==
X-Received: by 2002:a17:902:d4c1:b0:1cf:c329:6204 with SMTP id o1-20020a170902d4c100b001cfc3296204mr15511555plg.14.1701329640291;
        Wed, 29 Nov 2023 23:34:00 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id i16-20020a170902c95000b001c7283d3089sm612789pla.273.2023.11.29.23.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 23:33:59 -0800 (PST)
Message-ID: <c3accd5b-c8d9-4eb9-86a1-054e89893a8f@gmail.com>
Date: Thu, 30 Nov 2023 16:33:56 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Raise the minimum Sphinx requirement to 2.4.4
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <87sf4qvkmc.fsf@meer.lwn.net> <20231128023015.0e446a06@coco.lan>
 <877cm2uegr.fsf@meer.lwn.net> <20231128165645.2dbe416c@coco.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20231128165645.2dbe416c@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2023/11/29 0:56, Mauro Carvalho Chehab wrote:
[snip]

> While I didn't make any benchmarks, I remember people reported
> poor performance with newer versions, so, without thinking to
> much, 3.1 or 3.2 seems a good candidate for the recommended
> version.

Well, I have different impressions on the performance of Sphinx >=3.1
and have done some quick benchmarks.
Here are results on a not-so-performant machine.

Benchmark of building htmldocs on Ubuntu 22.04 (after "make cleandocs"):

Sphinx   elapesed   maxresident (k)
======== ========== ===============
 2.4.5     7m44.57     2806152      (parallel slot = 3)
 3.1.2    11m25.28     1036264      (parallel slot = 4)
 3.4.3    10m22.26     1067100      (ditto.)
 4.2.0    10m16.53     1151220
 4.3.2    10m06.07     1123432      (distro pkg of Ubuntu 22.04LTS)
 5.3.0    10m18.73     1145524
 7.2.6     9m53.80     1261736

python3: Python 3.10.12

Sidenotes:

  1: Sphinx 4.3.0 officially added Python 3.10 support.
     Sphinx 4.2.0 also works with Python 3.10.
     Sphinx <3.5.0 happen to work with Python 3.10.
  2: Sphinx 7.2.0 obsoleted Python 3.8.
  3: Sphinx 6.0.0 obsoleted Python 3.6 and 3.7.


And here is a table of distro Sphinx packages:

          As of 2023.11.30

----------------------------------
Distro              Sphinx Python3
=================== ====== =======
Ubuntu 22.04 LTS    4.3.2  3.10.12
Debian 11           3.4.3  3.9.2
Debian 12           5.3.0  3.11.2
Fedora 39           6.2.1  3.12.0
RHEL 9              3.4.3  3.9.18
Mageia 9            6.1.3  3.10.11
openSUSE Leap 15.5  4.2.0  3.6.15  (provided as python3-Sphinx_4_2_0)
----------------------------------

So, I think Sphinx 3.4.3 would be a reasonable choice for
recommending.

HTH,
Akira

> 
> Regards,
> Mauro

