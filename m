Return-Path: <linux-doc+bounces-37613-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABEA2F798
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E662A1883C26
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 18:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C83D1F463E;
	Mon, 10 Feb 2025 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igTIMuiw"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58D25E47F
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213010; cv=none; b=oFOGtPpgYVwJmT2UmdMAJxqjzwB4vOqWkCRCp+Qn77RQyZ19gPZ1GNcd5BHapruKqKdw8okam2EMUp/pVGBxqppDXIUFz2VLYqu5t/UmpEh1+kRViG7fcvmyM6x9stjN5BtXBDUna2gXFir8UAVQtQbjEPMtrmk1qtJ/DybpHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213010; c=relaxed/simple;
	bh=9Jl7Y6/T/ZwlfQk+GM7pxBzgJeex8ck2OrzDzPmY47U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWSc/nuJOnI0rSkCOnT2dC6J840Mb5DPRqTmPnwIoMVQlCSm16B2ZiqWuMWsWoXh74g3HdqmA0r7C2dXnIBkCT+/ra3NJp0SD+YTiauzFdM+Fh7qSMbbANJ1iMleTzSVmgbuqwhaLgOcvDRKnQh1xqxXRaIhKvtQhCKaE1/GyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igTIMuiw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739213007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
	b=igTIMuiwl3wIhJ5uWJe2j1RMDWe9DzrhjQoKHAoRBL9S7BBJpFNFeIAIdaNdA/3Ppz/lZG
	o5xqR9KwQrckVNZIoXYA9IVWY4jPWd+T2WB9r2CadcQ9FouzMTXEYf6pn/Y6wxceMeJcjN
	R6V1darc5zFpzVgMNdCJey1UgnxVFNI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-HzCiLRbXNTq8CErhm9e4ww-1; Mon, 10 Feb 2025 13:43:26 -0500
X-MC-Unique: HzCiLRbXNTq8CErhm9e4ww-1
X-Mimecast-MFC-AGG-ID: HzCiLRbXNTq8CErhm9e4ww
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394b8bd4e1so3193475e9.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 10:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213005; x=1739817805;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
        b=qFgGzx+fOXUB+o84FhzzZQGy28gY70qlxXd89JFzBoHZrdJhMy2iZqbzTmjkYQB+D4
         Z4RWUsDo21+Au/h3qDKcVPds3nKk1yAhwpKBSbflP3N/qDuRCxdzNz91QHVt80ZyUOuB
         Db9H1B5W9SPA29UHxDO8+S9xWAOfmwRWp0xPiNoJ7GCddSCW7DIXge32g+6ndFRDb42o
         AvlUWD1eF8MryZMgzivu7SbdMKTIEx7p4fwtL0BHOBA4K4xT+T4zQv5uGGw53CeOT8L0
         w4G8EdDwx9GO4j+EsYxeephdpRh6P3u7+nWzl1KI/eAKuWy11ueaSoovSZ2B9iNtH7Zl
         VLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtU77L9juSvSlbjGpdRg5vgQekD7uPvAt4TnaDmoRaYxdKtwhRgT60Fo1BmhubEQn+fghGchXHz0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sTFQqVhUx9sC2+kvkkxMqU0NFWwdPynQLih1/BZDMmZyLgHw
	UwdO538uWpb54AqUXQMdoR73SdjbmWwmE1RFjlHOLR6cIrb3vp9Lh41B54PbRRuREGFth0Mqg8V
	Nr/CRefKzduySlj5dbhaz0ZAoI0d0jfuT6Fxa4zU1+BQqiiljC0E2i0X4HA==
X-Gm-Gg: ASbGncsaEGixm3DZ+qao350/b8W5htMiRG8oT3dRLYMeKLr4BXoXxlSIjM1P1wYWNcL
	AHPfKxOumnIBP9fD3GggcGW/gXnuDZ0Qm0WHzWTPuQq7GGvTKWER1Csp2dVv9sTWjMYsC7CEGU0
	4Uw6DIW9PgR065Sf5Jxa0QaeWccNjk9wjfZl21IV2x1S52vJmFg4/IG2n58tR4CKdY1A+/ljC4I
	9+YAx+ZWXWozpOZs1YSi7Uf7AYVck6E3pIdCu60o18dE0EAQZxdZnDphZRR5Mw5JkyGqyvMHtxJ
	p69GGgucdwEVTdzatIWPESdBwTDHI2wEly+XuuGcPjQR5fFALF4g0kG4+5hpvGvRruMAuzmoXOS
	2ETIAFkkK5Xg6Tb0zPAnDsy6z2aesxTtP
X-Received: by 2002:a05:600c:1c25:b0:439:41dd:c066 with SMTP id 5b1f17b1804b1-43941ddc1f0mr58352165e9.31.1739213005111;
        Mon, 10 Feb 2025 10:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzpaPXHrmO8a6oz7FN6p5yKvrmK4zLskiJi4ioSu4niVqT7krVP8gCmrI1SDPa3yDqdwKozQ==
X-Received: by 2002:a05:600c:1c25:b0:439:41dd:c066 with SMTP id 5b1f17b1804b1-43941ddc1f0mr58351885e9.31.1739213004744;
        Mon, 10 Feb 2025 10:43:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13124217f8f.90.2025.02.10.10.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:43:23 -0800 (PST)
Message-ID: <ff5af15f-8f9b-4ddf-88d2-5bab52449399@redhat.com>
Date: Mon, 10 Feb 2025 19:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/20] huge_memory: Add vmf_insert_folio_pud()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <ef0f8d6a6fd340531613c351c99c98fd6f94ad93.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ef0f8d6a6fd340531613c351c99c98fd6f94ad93.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 23:48, Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to
> normal pages. To allow these to be managed the same as normal pages
> introduce vmf_insert_folio_pud. This will map the entire PUD-sized folio
> and take references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pud, which
> simply inserts a special devmap PUD entry into the page table without
> holding a reference to the page for the mapping.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 

Nit: patch subject should start with "mm/huge_memory:"

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


