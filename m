Return-Path: <linux-doc+bounces-1117-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA327D718F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 18:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF47281C45
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5782E63D;
	Wed, 25 Oct 2023 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DWRvHHtb"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153EB26E32
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 16:18:36 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E7B132
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 09:18:34 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cacf449c1aso9225745ad.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698250713; x=1698855513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arsy052jeDvZ80rgUaVwXGHmFjPuyeZ++dpm6EdQU54=;
        b=DWRvHHtb8RznXxlCuSaGMxuvPwz9yE7vgXHOdyDTVOJCiCD0rER18psMq0gAkHkPoF
         e4E3CCWOYBu/cS9YZzrJ0avkb3W1VlOhwmTFaBhLF7lXwfMWYs+SeeGjefQe7BtvMd6J
         dDpjw5hhgzE0KjHstkylhZUImFnzPDniMFyc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698250713; x=1698855513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=arsy052jeDvZ80rgUaVwXGHmFjPuyeZ++dpm6EdQU54=;
        b=LYV9MPPmVOg18kHw+ksZajmRgNo9d73XazRgbCMxGLgQyp9qCjkYCRpLpHDLjttiiy
         FqDhHl1UDmKbIJ/ZO/IOzEqGRDQ/37lbpJ+3KRxGmQ+PMcL5VOvfiAHeyTFWWKx3Uank
         c0+JRKe3wR4kKozDmiSwdZHZiSkf/WpUbu/mlmELArNkQLYI1O2zx8VzvJxJSftMj9eT
         evQinvFDnrHOLpnyczCkmktE51l/N9qQM/QOrEPWQ1BRpk0c/q43T4VJUlsITPaYgmBX
         DbHGHnXS0tCZP38yjp3f2AG2yOTkb/IlLDlPFQ5fmC5uqeGCxY5WDSq5W1KdlhgqqM1g
         Gjrg==
X-Gm-Message-State: AOJu0YyCoA7UyITJjpVu9fImTFiVdSJJrC/NFln02WouIy1IJPSyhZwX
	wz740u/TiqCdaRtCtiOKUxndpw==
X-Google-Smtp-Source: AGHT+IEHz2zX5L1X5ZAHX0Ckn5ujEv6EKrMfDsgQGnC0pIkIrr9N+ffoFA2gPE9N1Xa0GMZC2U4X2g==
X-Received: by 2002:a17:903:2348:b0:1bb:9e6e:a9f3 with SMTP id c8-20020a170903234800b001bb9e6ea9f3mr15207916plh.4.1698250713622;
        Wed, 25 Oct 2023 09:18:33 -0700 (PDT)
Received: from [172.20.1.11] ([12.222.71.83])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001c9d968563csm9387668plh.79.2023.10.25.09.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 09:18:33 -0700 (PDT)
Message-ID: <20dbb743-9cc0-4405-babd-024e64a0b673@linuxfoundation.org>
Date: Wed, 25 Oct 2023 10:18:31 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: fix reference to nonexistent document
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 "Srivatsa S . Bhat" <srivatsa@csail.mit.edu>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Arjan van de Ven <arjan@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Len Brown <len.brown@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20231022185446.919363-1-vegard.nossum@oracle.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231022185446.919363-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 12:54, Vegard Nossum wrote:
> This file was renamed from .txt to .rst and left a dangling reference.
> Fix it.
> 
> Fixes: 151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Arjan van de Ven <arjan@linux.intel.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Len Brown <len.brown@intel.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---

Thank you. Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git cpupower
branch for Linux 6.7-rc1.

thanks,
-- Shuah

