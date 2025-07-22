Return-Path: <linux-doc+bounces-53745-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F890B0D295
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jul 2025 09:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FBE1C2482D
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jul 2025 07:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0197E288C8F;
	Tue, 22 Jul 2025 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUUZiDn2"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1D2D12F1
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168827; cv=none; b=qcJIsuYBfCBxuJDz8OTnC+GfZbn9z+ahPMZ6UGUh5ItgOKXgXJE37W8HwbDm3ELfkbJYvaKU/EW0ltS7gvg5rdPTJE6nsAoEB/nrE2UMWTiInhqSEHl4B/oMAEoc3OFqnJtdRAo+C3tF0YTmqvp5A5J1YXbmRUeLN2qvXHmZnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168827; c=relaxed/simple;
	bh=nCpIqVdZh7fGOYFEF4LEq73KsSCNn+qV8uSC5B8wVGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xstdc0wBxOwwVLko8I0n99e8s2+s/NLeQUHZw/Ba7WdHCYLpQn2Xsr9vPZw4bYNpUBO+4Yh828OvgIP49w17knENbBH6hvGdhdrYwQfGyrj3shny9O6ksOgBxEC3rSqwiOgjShJkU3EivsjWtBBAVVksU+zJwNO1X3TnJAhzwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUUZiDn2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753168825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CozW1E5VHLpIUqBBRyUZDnDHcxpaM139xWKAC4+LRyk=;
	b=FUUZiDn2J9iCZcm0xWDLehUftnG23jPQ2EIkvS63gcrT0W7b5mCJ5aHm8rRY1UabQBZ6zu
	8KUCezmVbHIhYMSS9Rza/vTiEVUMTPXZPIDGRTGPsrh0De1SQ+PGg0MNrP8HOskYqLWpG4
	6fBSIOxm7DHHX/n+2nb2lUWY/lVi/nU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-jPrWBFtOPradTwtluXQRmw-1; Tue, 22 Jul 2025 03:20:23 -0400
X-MC-Unique: jPrWBFtOPradTwtluXQRmw-1
X-Mimecast-MFC-AGG-ID: jPrWBFtOPradTwtluXQRmw_1753168822
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-456267c79deso17135125e9.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 00:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168822; x=1753773622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CozW1E5VHLpIUqBBRyUZDnDHcxpaM139xWKAC4+LRyk=;
        b=DzEJ7d9fKzq93DGGdhp/BJktLO31IOzbw156s5X9STzU/Qo7nR3mjBDByd6m6MOFd5
         2CP8/tj0BNaPoYPzcaXRhqqFeqODyvo9MnZRjBmCJQd6iF+G4gZW/cEHtW70f0xByhE5
         7hhOPwRaQTHqcVTcQbsgdBXhcwmmIrd4mVg3rD9KqmTuN1q+srx20dMR0zxFDiD5LZvd
         +elrlVKY4QoVIu67UCc5ZhibqJj/iWY/VySZyUi4e2f5RSqz2AMeGUTa2EAAWZItQT7q
         q/NvFuRLZeHfr9x+EKaZE0gjlZDuLdm5z1ewyx4b4OVDggQ+bJeJRV6UgoLeEtz68Fif
         2H3A==
X-Forwarded-Encrypted: i=1; AJvYcCX8t9gxLFDw0QFFURuYvAdFi0u+XzyxqURLw8eH0gVCaL+W/zKwvuQwIdRHZH4HcPGIWr4CP3e/ygo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAI99Q/WzgtwFF9758l3h3/6+ThGVJct67dcPyE26Jzy497gQ
	DIha5jf8ZqjRs2ETwphbjXpNZj/iEu8vxhE5k17dm/lUtpOeDZTGvwkAvEUcyEnyORyEEYTClBU
	uTteWkXp1fTcwzDPfoF/jvQ0itvMicDSOrg151dbmv9a6uXcKhx6Aub7+nUcuqg==
X-Gm-Gg: ASbGnctSLUiOsh6JFWS0ODgck9OhVbj9g8giR+fVL9d8q2JtvPRv73FpkX27py/Tx4c
	ii8WSO9GEYDTgjImspm3h3eQ3LWx/DkfkvkMzZQ/ZtV7nBoRgXrROnYspPvPQl7NrGTtc1GRPT3
	grqRo0BE8GlR0Na4qyI3PWN0Czku8Ni6cJIuGhywcZ+QDTKQCVIjM6V4K3GzGaqE7Yeb7Oh4tEt
	T4ecEnrjQpdO7nwVvfmDPxizD3z1/+YnuBAeoyQku42RT39eMRWWvutmO2b8UjbOdcG/Tr6/exF
	OFWYE+C+XoAbuGu9UJrXm7r1w/zPQpHNbocTKsVSBikAgA10LblXr/7N9P4yuBpquj7mwIw=
X-Received: by 2002:a05:600c:3e0e:b0:456:2ce8:b341 with SMTP id 5b1f17b1804b1-4562f88ae8fmr231946025e9.17.1753168821971;
        Tue, 22 Jul 2025 00:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9aY+RfSXeUZQOme3p3eEvdvpsM+HvGTuV3xDyatmqQO926XAYqBAK0UL30IswRl+02loPhg==
X-Received: by 2002:a05:600c:3e0e:b0:456:2ce8:b341 with SMTP id 5b1f17b1804b1-4562f88ae8fmr231945585e9.17.1753168821260;
        Tue, 22 Jul 2025 00:20:21 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f597.dip0.t-ipconnect.de. [79.224.245.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e88474fsm185479545e9.22.2025.07.22.00.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 00:20:20 -0700 (PDT)
Message-ID: <39a75435-5fea-4816-b484-477d400c3564@redhat.com>
Date: Tue, 22 Jul 2025 09:20:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update THP documentation to clarify sysfs "never"
 setting
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721155530.75944-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250721155530.75944-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.07.25 17:55, Lorenzo Stoakes wrote:
> Rather confusingly, setting all Transparent Huge Page sysfs settings to
> "never" does not in fact result in THP being globally disabled.
> 
> Rather, it results in khugepaged being disabled, but one can still obtain
> THP pages using madvise(..., MADV_COLLAPSE).
> 
> This is something that has remained poorly documented for some time, and it
> is likely the received wisdom of most users of THP that never does, in
> fact, mean never.
> 
> It is therefore important to highlight, very clearly, that this is not the
> ase.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

Can we also somehow tone down or clarify the "entirely disabled"?

Something as simple as

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index bd49b46398c92..2267d22277238 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -107,7 +107,7 @@ sysfs
  Global THP controls
  -------------------
  
-Transparent Hugepage Support for anonymous memory can be entirely disabled
+Transparent Hugepage Support for anonymous memory can be mostly disabled
  (mostly for debugging purposes) or only enabled inside MADV_HUGEPAGE
  regions (to avoid the risk of consuming more memory resources) or enabled
  system wide. This can be achieved per-supported-THP-size with one of::


-- 
Cheers,

David / dhildenb


