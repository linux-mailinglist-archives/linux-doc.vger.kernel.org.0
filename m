Return-Path: <linux-doc+bounces-19057-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5F91115C
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 20:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17F11F21AA6
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 18:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4BD1B4C35;
	Thu, 20 Jun 2024 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m4xWuTcN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE01B14E8
	for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718909342; cv=none; b=JwveUCUlA0qwNp4viETOMqjt9qXjpmbYj5yvaEhj5h/Vz3WiPXWeiaxEzg80wThVNc+qcVME9aAhkQIA/OKprJ3PExTTVuen97ouoiKZ58mfsT922xRbeOxANf/KKyvvMudjnA6bpVXGgW6ZsZKW1283F2zUlpJXibLzHdQlO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718909342; c=relaxed/simple;
	bh=t2XJQlqBCgFWY1Lzks7J4DodAnhbYKX1VO5lOC5ak2M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bt+3iSYJxU6oUErENDCS4h+/XkqE0MjDDlJEcr+0lH3CkemvtXzy7coPWKebY6M4p+bPSpKd8CyFTHi4ZWQJ+iDaw3K89Jv/aqcBMCVaPGl/fyb+GNf99iv3sR/ooQwaBQEjEiSUT/gcOIbnjXfZVmeUL7BjhwfJs12bzepClUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m4xWuTcN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1f9a3831aa9so11391755ad.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718909340; x=1719514140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d9tdNDDl88qMcZ8yPf5Qu/IpIHQAZ5ZqhxULhpb88jo=;
        b=m4xWuTcNFvfVdO3frICaPfxv1GyJ3EfC2QYyRdnnU+iLZvHulpeaPf57/oO9Ox90Bb
         JO0W7q8XbIs+SkWWrRDXrBkjVCOLx3joqUXPDEuhGMisIyvqry/um6h5JwjL7T/Yggx4
         2UeUuuJ5S4F+2yBXHs2JKCHOyaUljmlMgPjk8RGZyAd2Yb77sUnQ7xvXnlsRX/QDmkJ2
         cHfwLieeG3ZKjtDF8s5nfT3YFn87PRHSwEJXes+QQZqcAxGMf9g936TF0kQ1sd6PqLYU
         Ja4p8bj1Irt+ynFJlTwNV7g5lH2KAflz35BDOHAilriH+mpRumtIbd9xTgibIA7xOnkq
         V9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718909340; x=1719514140;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9tdNDDl88qMcZ8yPf5Qu/IpIHQAZ5ZqhxULhpb88jo=;
        b=biCwSrOWgo7mM/AGEqEL2pW+EGa9cqNoUAGXTvrj3X1lLX0YnRYAdjO7QehLiILzGU
         r6hhUITZvCqfssOuLN1cT1NXEeylMJ5bEFOhwwGD/6eOvrispI/6bzo2faYBnXkgtI43
         ftfofqF2LQt80lZGVeEbFb6Z25BHum5u1qOFpI+LMni6qLkRbmqmiNRw8JLQOBCSIFjb
         5NOq40yG7mJ2AinVk8IPTACQOPAzyOVOENLWNyv8DVvnC+0TL+Gj2M9jxnDp2iUtS16v
         gxW/39iVv3bLUZU7eAjUoVTvWmJN9Bc8/lkZK0ukewoz9uShgyCtPTIRont2MkF2dYtp
         eEeA==
X-Forwarded-Encrypted: i=1; AJvYcCXjaHae82+6BiGY+7ghbLhJcM2vfn5IMeWb2VFl1npIK1w2ikHBbyBgKQPRZFSJksja3780RU9cqXITBq2nV2JFeh9jHPpnFSHQ
X-Gm-Message-State: AOJu0YxBU9/bpofuZBFe9BGk6y+CY88fKo2DZAD0SvmNQV137psPI2bh
	LsA3weDyPifCrIySXJjty8fT7lFut6Ts9mNYkPgd1H33eKRYWJOCZ7TBc8FyK8NBASg0igdEJFz
	Ll/rDXRWypg==
X-Google-Smtp-Source: AGHT+IGeFtSm0Ob5GbXFXzE2dfom7nuBRbI+HybKNWPf03Ehp6HFBkwzY/nxmSyoKG+btklxI5CDQ60BWXewkA==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:903:1cf:b0:1f6:84b5:1e10 with SMTP id
 d9443c01a7336-1f9aa396c7bmr1298975ad.1.1718909339520; Thu, 20 Jun 2024
 11:48:59 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:48:52 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240620184856.600717-1-jiaqiyan@google.com>
Subject: [PATCH v4 0/4] Userspace controls soft-offline pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	osalvador@suse.de
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, rientjes@google.com, duenwen@google.com, fvdl@google.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Correctable memory errors are very common on servers with large
amount of memory, and are corrected by ECC, but with two
pain points to users:
1. Correction usually happens on the fly and adds latency overhead
2. Not-fully-proved theory states excessive correctable memory
   errors can develop into uncorrectable memory error.

Soft offline is kernel's additional solution for memory pages
having (excessive) corrected memory errors. Impacted page is migrated
to healthy page if it is in use, then the original page is discarded
for any future use.

The actual policy on whether (and when) to soft offline should be
maintained by userspace, especially in case of an 1G HugeTLB page.
Soft-offline dissolves the HugeTLB page, either in-use or free, into
chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
If userspace has not acknowledged such behavior, it may be surprised
when later mmap hugepages MAP_FAILED due to lack of hugepages.
In case of a transparent hugepage, it will be split into 4K pages
as well; userspace will stop enjoying the transparent performance.

In addition, discarding the entire 1G HugeTLB page only because of
corrected memory errors sounds very costly and kernel better not
doing under the hood. But today there are at least 2 such cases:
1. GHES driver sees both GHES_SEV_CORRECTED and
   CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
2. RAS Correctable Errors Collector counts correctable errors per
   PFN and when the counter for a PFN reaches threshold
In both cases, userspace has no control of the soft offline performed
by kernel's memory failure recovery.

This patch series give userspace the control of softofflining any page:
kernel only soft offlines raw page / transparent hugepage / HugeTLB
hugepage if userspace has agreed to. The interface to userspace is a
new sysctl called enable_soft_offline under /proc/sys/vm. By default
enable_soft_line is 1 to preserve existing behavior in kernel.

Changelog

v3 => v4:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com>,
  Andrew Morton <akpm@linux-foundation.org>, and
  Oscar Salvador <osalvador@suse.de>.
* insert a refactor commit to unify soft offline's logs to follow
  "Soft offline: 0x${pfn}: ${message}" format.
* some rewords in document: fail => will not perform.
* v4 is still based on commit 83a7eefedc9b ("Linux 6.10-rc3"),
  akpm/mm-stable.

v2 => v3:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com>,
  Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>,
  and David Rientjes <rientjes@google.com>.
* release potential refcount if enable_soft_offline is 0.
* soft_offline_page() returns EOPNOTSUPP if enable_soft_offline is 0.
* refactor hugetlb-soft-offline.c, for example, introduce
  test_soft_offline_common to reduce repeated code.
* rewrite enable_soft_offline's documentation, adds more details about
  the cost of soft-offline for transparent and hugetlb hugepages, and
  components that are impacted when enable_soft_offline becomes 0.
* fix typos in commit messages.
* v3 is still based on commit 83a7eefedc9b ("Linux 6.10-rc3").

v1 => v2:
* incorporate feedbacks from both Miaohe Lin <linmiaohe@huawei.com> and
  Jane Chu <jane.chu@oracle.com>.
* make the switch to control all pages, instead of HugeTLB specific.
* change the API from
  /sys/kernel/mm/hugepages/hugepages-${size}kB/softoffline_corrected_errors
  to /proc/sys/vm/enable_soft_offline.
* minor update to test code.
* update documentation of the user control API.
* v2 is based on commit 83a7eefedc9b ("Linux 6.10-rc3").

Jiaqi Yan (4):
  mm/memory-failure: refactor log format in soft offline code
  mm/memory-failure: userspace controls soft-offlining pages
  selftest/mm: test enable_soft_offline behaviors
  docs: mm: add enable_soft_offline sysctl

 Documentation/admin-guide/sysctl/vm.rst       |  32 +++
 mm/memory-failure.c                           |  38 ++-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/hugetlb-soft-offline.c       | 229 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 6 files changed, 297 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/mm/hugetlb-soft-offline.c

-- 
2.45.2.741.gdbec12cfda-goog


