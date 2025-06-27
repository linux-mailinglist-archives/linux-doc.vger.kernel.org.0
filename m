Return-Path: <linux-doc+bounces-50959-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E511AEB4CA
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 12:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9180F1C276F2
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FC02D97A8;
	Fri, 27 Jun 2025 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJKIDDKl"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB48229A307
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020089; cv=none; b=LdEVfX+SesFIiU6aena+V/a0q+jJmicI+9MB5sXL89votC038w2FRGFl2IcIdfe0AibwMWhHLNKNnUwwaNZoBfDDOFA1pAGrMOx8olEAGQCIm1+A/0pY57y2P1GL9SvnCrJZAR/j1Zq7Wtz/3RFOzoqBqsjk9ewmUuFUKBjPTBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020089; c=relaxed/simple;
	bh=L+QrdPiV6RVKjdNxIalHS5LAvUl5JKrsnqMr9MWkF+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtHwudtPddmihFKComKkfXUKZMJwF9lZ1V8jDmLa1Q69yjPWssJWOGD//cdem3oodOWwL4cfmiHs3rPP3rE0l4KDKoVjyHn9mD1j6+W/4JopvWDFQVBiB8EdRxNrKwsSAeBW6oMdicJcdl8QGAy3Gsj7mb71GM53o8ogU6ccXVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJKIDDKl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751020086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJdsZHiVVLuKwLXH4KCxaDOcm8lE5bSikqTqeRxiKOY=;
	b=BJKIDDKlxqVgG0CBYGsq2nqvXlwkAsb9Qlb5Jt6zlLQHAwsAnQy/tUIlPD4nu0JpSjBXOh
	opWs0yj59upxeqt2iViwRkrj1vwmW5QMRPxoXxmJs+Xcjne6GN0j/VrxZd8CLwUNAtPETL
	oySCYsU4/yVnczu+wOJbd+PLt6+lE8s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-hK49v29fOl6FDvJX3Jq4UA-1; Fri, 27 Jun 2025 06:28:05 -0400
X-MC-Unique: hK49v29fOl6FDvJX3Jq4UA-1
X-Mimecast-MFC-AGG-ID: hK49v29fOl6FDvJX3Jq4UA_1751020084
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451dda846a0so14784695e9.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020084; x=1751624884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJdsZHiVVLuKwLXH4KCxaDOcm8lE5bSikqTqeRxiKOY=;
        b=mflciDQSOwQfLMzfowpybbJ8dZ2JHTvZRFB2JqxQVsLCppasdqnXoDjzg28rE4JpEb
         q2SbeKWHR7zX7fJZWpHxn4lhiPlg1ReUSKpHSBNDWcr95bkzMuWSmmj4iiMW089y6/iw
         9zAEz02Lp/EGlZMvAqPDEznGvr50RLUZv1W6q50KYYZCQuToBm+iZ9NV6NboKGfB+MN9
         UiW3O1KO4PKkC/KvyzXIC/ChtmUy/AqZDIqS/TLEGfuITXkYjNxgBkNV9sjnPmt7bCEb
         DeXZJkwSNSjN1y9WOEFquRLqNcSWN0RYv1kox8EiGC28Zfd3mL/fAqQsYska9NsqkPdW
         BE9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBuGZB+w1HJ8ZgdY6pRQ3VQl4vn2JnhLKIx2B6ow4Neq/Xc/6hR5cjuP2Qxh+d8sIDHz+zfnhbQ5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QwmNQ6nBDa6yWr2M++xdtou53kDk62mnwgs78SMjpKbGl/6M
	GllZn4A4zvGP7sFxWj9GY0X0j8cap7c/iWDgwazD7Y/it8q5+lutf3UI4mEp7wl0QOJK+eXJEw5
	dDsiKHuloaMng1Dx57H0mKRICG0MDGE7est+l79Y4IxEuLTPsM68x9V3NGzNw7Q==
X-Gm-Gg: ASbGnculivzxeP4/app6JLokmxbMqaoLiNoOTNptlI+RQ5IwcdK/qR0Z+FUoZI7fCn+
	T33s5g5GRly1Tv15PpyB/7BrdKDUkNEknObemmja3NjTLcV3qpglRSlXUrrpF0JLSF3EbFfZ5+e
	PUmv8v3VoYKM/BgJ01zzs1ktuOE5r/D8Ls/XJOuo8lJeobmss2i4okFHeNrnVEIwlP2paxDvvj8
	J8Yuv/c3T8Td74bDsR2rBPW3WoQJVnvgWDyk78wnaLPlANho0VZlMXwz0rFBeQM3drqvPYi+ZUH
	yrBUStqOQFG6XHZVm7r05KaZjAlijKk2hw5UnuwK1dBuG4dDhynS+Ql2DT51W91d6XewNw==
X-Received: by 2002:a05:600c:674f:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4538ee8384emr26594105e9.19.1751020083755;
        Fri, 27 Jun 2025 03:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9k4IjA2+y/oHun89HaX7Ynjd/DsFZcqDREnTUjAINHGGZ0PW4fhojEDavNVYzeGalZ02RXQ==
X-Received: by 2002:a05:600c:674f:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4538ee8384emr26593745e9.19.1751020083235;
        Fri, 27 Jun 2025 03:28:03 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm73314445e9.10.2025.06.27.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:28:02 -0700 (PDT)
Message-ID: <d172caa9-6d31-45a3-929c-d3927ba6702e@redhat.com>
Date: Fri, 27 Jun 2025 12:28:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended
 features
To: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
References: <23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni@redhat.com>
 <202506271443.G9cAx8PS-lkp@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <202506271443.G9cAx8PS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 8:41 AM, kernel test robot wrote:
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250624-221751
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni%40redhat.com
> patch subject: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended features
> config: csky-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271443.G9cAx8PS-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/uaccess.h:12,
>                     from include/linux/sched/task.h:13,
>                     from include/linux/sched/signal.h:9,
>                     from include/linux/rcuwait.h:6,
>                     from include/linux/percpu-rwsem.h:7,
>                     from include/linux/fs.h:34,
>                     from include/linux/compat.h:17,
>                     from drivers/vhost/net.c:8:
>    arch/csky/include/asm/uaccess.h: In function '__get_user_fn.constprop':
>>> arch/csky/include/asm/uaccess.h:147:9: warning: 'retval' is used uninitialized [-Wuninitialized]
>      147 |         __asm__ __volatile__(                           \
>          |         ^~~~~~~
>    arch/csky/include/asm/uaccess.h:187:17: note: in expansion of macro '__get_user_asm_64'
>      187 |                 __get_user_asm_64(x, ptr, retval);
>          |                 ^~~~~~~~~~~~~~~~~
>    arch/csky/include/asm/uaccess.h:170:13: note: 'retval' was declared here
>      170 |         int retval;
>          |             ^~~~~~
> 
> 
> vim +/retval +147 arch/csky/include/asm/uaccess.h
> 
> da551281947cb2c Guo Ren 2018-09-05  141  
> e58a41c2226847f Guo Ren 2021-04-21  142  #define __get_user_asm_64(x, ptr, err)			\
> da551281947cb2c Guo Ren 2018-09-05  143  do {							\
> da551281947cb2c Guo Ren 2018-09-05  144  	int tmp;					\
> e58a41c2226847f Guo Ren 2021-04-21  145  	int errcode;					\
> e58a41c2226847f Guo Ren 2021-04-21  146  							\
> e58a41c2226847f Guo Ren 2021-04-21 @147  	__asm__ __volatile__(				\
> e58a41c2226847f Guo Ren 2021-04-21  148  	"1:   ldw     %3, (%2, 0)     \n"		\
> da551281947cb2c Guo Ren 2018-09-05  149  	"     stw     %3, (%1, 0)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  150  	"2:   ldw     %3, (%2, 4)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  151  	"     stw     %3, (%1, 4)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  152  	"     br      4f              \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  153  	"3:   mov     %0, %4          \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  154  	"     br      4f              \n"		\
> da551281947cb2c Guo Ren 2018-09-05  155  	".section __ex_table, \"a\"   \n"		\
> da551281947cb2c Guo Ren 2018-09-05  156  	".align   2                   \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  157  	".long    1b, 3b              \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  158  	".long    2b, 3b              \n"		\
> da551281947cb2c Guo Ren 2018-09-05  159  	".previous                    \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  160  	"4:                           \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  161  	: "=r"(err), "=r"(x), "=r"(ptr),		\
> e58a41c2226847f Guo Ren 2021-04-21  162  	  "=r"(tmp), "=r"(errcode)			\
> e58a41c2226847f Guo Ren 2021-04-21  163  	: "0"(err), "1"(x), "2"(ptr), "3"(0),		\
> e58a41c2226847f Guo Ren 2021-04-21  164  	  "4"(-EFAULT)					\
> da551281947cb2c Guo Ren 2018-09-05  165  	: "memory");					\
> da551281947cb2c Guo Ren 2018-09-05  166  } while (0)
> da551281947cb2c Guo Ren 2018-09-05  167  

AFAICS the issue reported here is in the arch-specific uaccess helpers
and not related to this series.

/P


