Return-Path: <linux-doc+bounces-30013-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7AD9BDD68
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 04:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0AE31C231A0
	for <lists+linux-doc@lfdr.de>; Wed,  6 Nov 2024 03:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10E718FC80;
	Wed,  6 Nov 2024 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fR2jIe5u"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0DA18D63A
	for <linux-doc@vger.kernel.org>; Wed,  6 Nov 2024 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730862599; cv=none; b=Ff6yD+Oia/a8O5jewRfml193hIf2i22dlg2hQ4fBZ30Bd4GUJdNhpZOyU0uWhxIK7FTVNOUN1tRwZwb1GbD8IZjVhc9kg5IHFTndghb6MSb3G180seEy0/Otif8WVOkVY/IBoScpnHaduZku8s2RgMi0zeSlf+qsUGjRAktsLg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730862599; c=relaxed/simple;
	bh=Cif+vBtnjYnxwSd+Rt3oRGq12CB5DlLtiisZD0fCOfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHrx0r2R8EfcPHQs82dCngTKUQ2DdsqDTnZYzOPaefVTLXbEpyMzpSdNwOaT8geBXQz5+v7s5toxEx/UK74935vkgT4fMoaPNmpQIofIP4rHeAqzZKthMfzrT4Ed1Qt+98tA6XFskNgnfkiymzm+HgLSTqR9eo8s+WHX3TwQ0Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fR2jIe5u; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e681bc315so322657b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 19:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730862596; x=1731467396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJJ4//7bLOxEBzzcePvQMSHmxMCqJrcmMS56wQXcOKg=;
        b=fR2jIe5u4VoHjGSp3gwgWefNFZC5gJOJOr8qyvqScsBlmtkoQT4C1m/XIhCgMpgIyG
         nwZYIuA2Ay8wa280sM+L28tCm4Ie1VSrEVeS8/QyIojGoq0FirMOpZBc+16Pz2cosSFp
         1tzDOiFv7vap3zwL8QkQohdnnzsQtraERF5vK3LfNe/KcNXvG8XjxYtvueLWx/pAfUyk
         FDE64MzDyWdOxXR9Nk36EDt6GexIXaF400cjJkeSmNYjfNeQnr851DYYshdHxy4xezHe
         YURkCPJt8ni0mXrsd0n0qcG6fo0ZRTiAGTlOCwguhu5k98YaOJqJt4Qq5M/WiVjf7ZJH
         zo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730862596; x=1731467396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJJ4//7bLOxEBzzcePvQMSHmxMCqJrcmMS56wQXcOKg=;
        b=FazKm+z0JDpXvb3N2q0vri8GE5GUhXlBUEsNkFZJi4HRNy2akzckMAZplXt+g7a3H3
         yMSaxYYDlOPYynNtUXEw8uMiHDRdRVKIfgT6IIAQwj7R4McHZJmgTbxHE33WDvgIwn+T
         nSkQEKuM4Vn6/RIxA8K2irj6XcwQtMs5v68Zk34h6aFMFMiTCYlFCZYmVYBNEfJACC23
         jP8U/+ipAszjFbWgIKqsGVvCSx+vK9Au+OvFOCHP2OtfcX1dEHCwCDmHE/W4/vvi+6pQ
         5JmK4HX1ErGjBgHEntcjgulWPOiyJll0EIs1Dl1o56UBFv7moi0vXoBV5T02dQqpL/XJ
         pBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpIpU4+O48QlZax3Fwa6RvAX9wUeIZjEsGin6tvbNKFx/kvjKYmco8867by4QkM/3cfYuGz5LG+uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXaSWYe7neW+X+RKvm35gpiSldPpS0HYC3NOC+fFqBPrHR7mK6
	ey4CUhc7V2XvcfAUN32hwycXjkPE+tlj3/AYRHzQN9/7/q9uD16u/fHOJ/OnNKQ=
X-Google-Smtp-Source: AGHT+IHBwkmXZOKA15JmPL3jtnBRqc8ey/KEXtUKR9FaxQ0zlyGhFQ+Nk2fN9DHaMcJvrMsMFFhSCw==
X-Received: by 2002:a05:6a00:b93:b0:71e:41a6:a0c6 with SMTP id d2e1a72fcca58-723f7a99d60mr1224329b3a.13.1730862596341;
        Tue, 05 Nov 2024 19:09:56 -0800 (PST)
Received: from [10.84.149.95] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8ce8sm10500455b3a.35.2024.11.05.19.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 19:09:55 -0800 (PST)
Message-ID: <c0f64fa7-81fd-4691-86b5-2ad39ba9d8a7@bytedance.com>
Date: Wed, 6 Nov 2024 11:09:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
Content-Language: en-US
To: Jann Horn <jannh@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAG48ez0qsAM-dkOUDetmNBSK4typ5t_FvMvtGiB7wQsP-G1jVg@mail.gmail.com>
 <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local>
 <CAG48ez1eeQatc0GC_hfOM_mvwjwQ=89JDmp_U5_diLy7ycjEdQ@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAG48ez1eeQatc0GC_hfOM_mvwjwQ=89JDmp_U5_diLy7ycjEdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jann,

On 2024/11/5 05:29, Jann Horn wrote:
> On Mon, Nov 4, 2024 at 5:42 PM Lorenzo Stoakes

[...]

> 
> I think it's important to know about the existence of hardware writes
> because it means you need atomic operations when making changes to
> page tables. Like, for example, in many cases when changing a present
> PTE, you can't even use READ_ONCE()/WRITE_ONCE() for PTEs and need
> atomic RMW operations instead - see for example ptep_get_and_clear(),
> which is basically implemented in arch code as an atomic xchg so that
> it can't miss concurrent A/D bit updates.
> 

Totally agree! But I noticed before that ptep_clear() doesn't seem
to need atomic operations because it doesn't need to care about the
A/D bit.

I once looked at the history of how the ptep_clear() was introduced.
If you are interested, you can take a look at my local draft below.
Maybe I missed something.

```
mm: pgtable: make ptep_clear() non-atomic

     In the generic ptep_get_and_clear() implementation, it is just a simple
     combination of ptep_get() and pte_clear(). But for some architectures
     (such as x86 and arm64, etc), the hardware will modify the A/D bits 
of the
     page table entry, so the ptep_get_and_clear() needs to be overwritten
     and implemented as an atomic operation to avoid contention, which has a
     performance cost.

     The commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
     check") adds the ptep_clear() on the x86, and makes it call
     ptep_get_and_clear() when CONFIG_PAGE_TABLE_CHECK is enabled. The page
     table check feature does not actually care about the A/D bits, so only
     ptep_get() + pte_clear() should be called. But considering that the 
page
     table check is a debug option, this should not have much of an impact.

     But then the commit de8c8e52836d ("mm: page_table_check: add hooks to
     public helpers") changed ptep_clear() to unconditionally call
     ptep_get_and_clear(), so that the  CONFIG_PAGE_TABLE_CHECK check can be
     put into the page table check stubs (in 
include/linux/page_table_check.h).
     This also cause performance loss to the kernel without
     CONFIG_PAGE_TABLE_CHECK enabled, which doesn't make sense.

     To fix it, just calling ptep_get() and pte_clear() in the ptep_clear().

     Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 117b807e3f894..2ace92293f5f5 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -506,7 +506,10 @@ static inline void clear_young_dirty_ptes(struct 
vm_area_struct *vma,
  static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
                               pte_t *ptep)
  {
-       ptep_get_and_clear(mm, addr, ptep);
+       pte_t pte = ptep_get(ptep);
+
+       pte_clear(mm, addr, ptep);
+       page_table_check_pte_clear(mm, pte);
  }

```

Thanks!


