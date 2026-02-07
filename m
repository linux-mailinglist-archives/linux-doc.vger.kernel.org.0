Return-Path: <linux-doc+bounces-75611-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ESnBHyeh2k7awQAu9opvQ
	(envelope-from <linux-doc+bounces-75611-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Feb 2026 21:20:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB41070CA
	for <lists+linux-doc@lfdr.de>; Sat, 07 Feb 2026 21:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E24713004F1A
	for <lists+linux-doc@lfdr.de>; Sat,  7 Feb 2026 20:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DEE33CEA1;
	Sat,  7 Feb 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBqajeUO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7E33CEB0
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495608; cv=none; b=dKjHIBBfAH+5uyXKaXA1PKI4mFmRfXRujwszwlL1eiaCyuF9t+Of+iq/Ohaucqb62Y3a+IgbrIMzRzWzflCiZP+sFKoXmTRdpHwl8xqGsemD+TeDRoU4vPONoe0zpVvE0Lum5oxB0ISPjmgKKQu0lODNjvJTZJO8SicOLWPvom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495608; c=relaxed/simple;
	bh=ImAYCiSTK6i1+gxOxS9jG+GM+vLaHxdB1SVCmCPXlrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUFwCkhpdyQR/mjCoohefA0bmikvicZAs4kuGkdMkPTy92Ih7plH4T0+SalAJaz8+UjYpVotoSI3WgUSVTTL+x+ZCPjW+ihQY8DHRpwpf4mCM7paAyIu48Q6b7BjRBrHqBvm8VR83JY6qrKWVgIPebuO7AafTJV+B5RO4JIei4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBqajeUO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f2599980so38497825e9.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495607; x=1771100407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=PBqajeUO3NBqRKAwo6Emtog/2rVmNiDc6KwTyAq3mOHpqEauRwgY4qFIPA+x0EJhKS
         drrokrqd1uYu8XqOLPDgc3xu15WI81PSnn53eFlzoZOdU26vUo9t30c0T9L/0XnvoexG
         vHA1ue9AA6ZlVBF7GPYe4Sdlf0Ry/PFu46L27NTIjfC3pYKm4T0fbp4192eT5EHj92eJ
         Y2N7OGrPW2pRTcRiqjkSlh4kSn89WVGbWmWbtcV7DEcFN82CW9vbS7wyZiKZldVE1qTr
         O7aeve90VwuqaP11vGg8hiC2a97kZvmQcZIDqtFt+65ivd9Bq1tIjjtcHz0FriFq6bT5
         e1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495607; x=1771100407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=Uodru5trJHvJsPB0/kT6u1sfGwuwvJ2K+TN7lHiH66leS5TYIE5VVPVbF7iuBzVyq0
         HlilbV9MINMMJ8B8akVW8uUgFNDqGoFUMRAfZyvNQElHkpeTu+CLzbGPixY88QM8fFlF
         F/x0dlYx9WgPCy7ZBPDFuIxLoL8KTmV7zMANbuy/Os3y7EMeyMYEtLsZ05y0TqzvXSHF
         tPu31TFMcVsBDWQfjA9iyKv4uayL8VLUEoadj3G7cTUY2bb0Qzvt7pk0oI2PRxZsl2Id
         7Bku/sJFnXPzVyrXtOS7IDJrzjq6kw/7AE2vXxxQEbJSMt7TXumZmH8z7dSYEmI04IB4
         w70Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIuwRPk80y4vmWqxC6s+Hhj+MBdw5UexhdkgWam3EVVWTumsM3l4Zml7au+MUAdYqUwEMh5/dXCFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvEJk8e+kFxqHM+w4UGr5THyPV6PcYHyx6Oydjplg6P7OoWTl
	ecduLcuFcgGuA7CQqVQ2COcTY3EdaSzN+0j9n8zE8qgoRFVtoMdakKY1
X-Gm-Gg: AZuq6aLROlu4Zxt58p/y7YQjsAPBoa+wzZzQ7GpzwrFk50ZL53xoixo36cLXbugIsXh
	6T87AeF0MPvh7r/0QloXOqACxU87kWB3AAbTNgM9kW/G4rGUX5QXV70HO6wLr61/i0u1cLGawvV
	psCpgJyx773Tr1oF9DMdXCJXQlMmAvBqOHO65y9K4PXvnkDO4AI8dlL0y68oXmd0S8i4peq4KXJ
	0T3pQ0H9VgxlgIK6Hys2cjWxEPMOSEKsvuzSe+pOJC3H32xZJWADnpMFNeeCwQ8TSQQlXqxby3D
	ExvX0u1Bd9b3/FHN3pHitwMEfNa+bYIPZ/VbHzB1LhqsrOGhjH/xlP65psDBf88q28Umz08brSQ
	gSpBCJBVIKwLn1ZAbPemRNleQZeSE1mvzbOHrr4Zc05Ykle9rnBBkZry/rrsncc5vbk3/j7aVwm
	6FIeR7z/oiHFJ2Yh52q3Ss5i6SrvNIbN4twJs39rQMUFdwYjLW8qMmWasoHIUosO1iFYXvGKzhu
	+c1piPngqZGmg0=
X-Received: by 2002:a05:600c:548d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483201ecd90mr108547085e9.13.1770495606497;
        Sat, 07 Feb 2026 12:20:06 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209cfd77sm51750705e9.14.2026.02.07.12.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:20:05 -0800 (PST)
Message-ID: <f4e66e8d-d285-4362-8bc9-fef00f2f624d@gmail.com>
Date: Sat, 7 Feb 2026 20:20:04 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 01/17] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-2-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-2-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75611-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usamaarif642@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3AB41070CA
X-Rspamd-Action: no action



On 02/02/2026 15:56, Kiryl Shutsemau wrote:
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>

Acked-by: Usama Arif <usamaarif642@gmail.com>

