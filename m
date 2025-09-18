Return-Path: <linux-doc+bounces-59830-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE6B5264E
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 04:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBB548833F
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 02:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C041E23496F;
	Thu, 11 Sep 2025 02:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M1G8t34H"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E9122688C
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 02:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757556791; cv=none; b=OubsQC26lx0UwLq+4bx9jlHlT7Mtu0weQbTz4iwllOIBDo6f7vht9wONQOyG9Vtx3rqKkRiZmXVMHK8sYKi+K91vN7lh2GRdi8mNuqbiGXCcGDf5ydCB/yJ0x7MBpdTUy3kn4dFSG/BD3SM09Isv+OK9OaLpKrWYl0VBLMYEkW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757556791; c=relaxed/simple;
	bh=MiFkUNNLIs6svqoUo8bA/tnfrB6BFBFyn24WE5dbnC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTak6+Yvc/xFWH6dFBic47a5cLEqRYzrw2zXMXym6bSIqk+1K4wG9l2cqD130OP6r6qEzggou5x4BApAzb+I1hV/cBKYHCVzvc56GbUeJMjiURdemACLj8a5PC0YKHSP/LbriiEqfMdyCLiqbBGFaAG7FrNRB7FU8AxrxDbn/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M1G8t34H; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <49b70945-7483-4af1-95ba-e128eb9f6d7e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757556786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x97LCOYyTXkOfHYlT/QUqsdu9EY9w2HudE5QcAbwMs=;
	b=M1G8t34H0j0/s6kKNLbIj/nDQ8gNW61ZSNACRNV2OIl3EYf/+ktW1Iv26EI/RWOojX6wwm
	4SSrTVjmZNyULE2yRObTF4Oi2atDivC4ft5N6eclHcEGgMcWHqB0D+7QD/+C+rl0xOm2zc
	1zLu7Gvq5NRCnb++mS9mooyudDthQkU=
Date: Thu, 11 Sep 2025 10:12:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task from
 khugepaged_mm_slot
Content-Language: en-US
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 gutierrez.asier@huawei-partners.com, rientjes@google.com, andrii@kernel.org,
 david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, ameryhung@gmail.com, ryan.roberts@arm.com,
 lorenzo.stoakes@oracle.com, usamaarif642@gmail.com, willy@infradead.org,
 corbet@lwn.net, npache@redhat.com, dev.jain@arm.com, 21cnbao@gmail.com,
 shakeel.butt@linux.dev, ast@kernel.org, daniel@iogearbox.net,
 hannes@cmpxchg.org, kernel test robot <lkp@intel.com>
References: <20250910024447.64788-2-laoar.shao@gmail.com>
 <202509110109.PSgSHb31-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <202509110109.PSgSHb31-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Yafang,

On 2025/9/11 01:27, kernel test robot wrote:
> Hi Yafang,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp-remove-disabled-task-from-khugepaged_mm_slot/20250910-144850
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250910024447.64788-2-laoar.shao%40gmail.com
> patch subject: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task from khugepaged_mm_slot
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250911/202509110109.PSgSHb31-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110109.PSgSHb31-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110109.PSgSHb31-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> kernel/sys.c:2500:6: error: call to undeclared function 'hugepage_pmd_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      2500 |             hugepage_pmd_enabled())
>           |             ^
>>> kernel/sys.c:2501:3: error: call to undeclared function '__khugepaged_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      2501 |                 __khugepaged_enter(mm);
>           |                 ^
>     2 errors generated.

Oops, seems like hugepage_pmd_enabled() and __khugepaged_enter() are only
available when CONFIG_TRANSPARENT_HUGEPAGE is enabled ;)

> 
> 
> vim +/hugepage_pmd_enabled +2500 kernel/sys.c
> 
>    2471	
>    2472	static int prctl_set_thp_disable(bool thp_disable, unsigned long flags,
>    2473					 unsigned long arg4, unsigned long arg5)
>    2474	{
>    2475		struct mm_struct *mm = current->mm;
>    2476	
>    2477		if (arg4 || arg5)
>    2478			return -EINVAL;
>    2479	
>    2480		/* Flags are only allowed when disabling. */
>    2481		if ((!thp_disable && flags) || (flags & ~PR_THP_DISABLE_EXCEPT_ADVISED))
>    2482			return -EINVAL;
>    2483		if (mmap_write_lock_killable(current->mm))
>    2484			return -EINTR;
>    2485		if (thp_disable) {
>    2486			if (flags & PR_THP_DISABLE_EXCEPT_ADVISED) {
>    2487				mm_flags_clear(MMF_DISABLE_THP_COMPLETELY, mm);
>    2488				mm_flags_set(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
>    2489			} else {
>    2490				mm_flags_set(MMF_DISABLE_THP_COMPLETELY, mm);
>    2491				mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
>    2492			}
>    2493		} else {
>    2494			mm_flags_clear(MMF_DISABLE_THP_COMPLETELY, mm);
>    2495			mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
>    2496		}
>    2497	
>    2498		if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm) &&
>    2499		    !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
>> 2500		    hugepage_pmd_enabled())
>> 2501			__khugepaged_enter(mm);
>    2502		mmap_write_unlock(current->mm);
>    2503		return 0;
>    2504	}
>    2505	

So, let's wrap the new logic in an #ifdef CONFIG_TRANSPARENT_HUGEPAGE block.

diff --git a/kernel/sys.c b/kernel/sys.c
index a1c1e8007f2d..c8600e017933 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2495,10 +2495,13 @@ static int prctl_set_thp_disable(bool 
thp_disable, unsigned long flags,
                 mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
         }

+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
         if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm) &&
             !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
             hugepage_pmd_enabled())
                 __khugepaged_enter(mm);
+#endif
+
         mmap_write_unlock(current->mm);
         return 0;
  }

Cheers,
Lance

