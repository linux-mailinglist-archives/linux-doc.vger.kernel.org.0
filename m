Return-Path: <linux-doc+bounces-95470-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXmqM4JYTWq6ygEAu9opvQ
	(envelope-from <linux-doc+bounces-95470-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 21:50:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80471F65D
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 21:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rUAf1I4g;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95470-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95470-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932EE302ED51
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 19:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0D3387346;
	Tue,  7 Jul 2026 19:46:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570F3932F1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:46:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453611; cv=none; b=YryjMCx2nR3wSaYtS8GJlDSvN/J9uGvS+vkN1Aw3tGcusiullNc9M+N6ouu8oRDRkGvxCfztXHHeZFRmCtITEFc0jLolOL9HncVd3HrrM9MIXfJwOEgevXTu9R46OH63NFMiRKP2OEszpEj0zuDNmcXbKI6y6Cdbq9++httYuD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453611; c=relaxed/simple;
	bh=Shg/8GedDZwNIvZhd6em8zNixBLrHR/bmhAPFRGlaLo=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=fiRpRNANW/vqPaK0uiNGB1wzIr3T+7pfIS/yxqAHaocgeB0UOzvvJW5DfNKXix6F7ECCe7crcdas/fxhg0d/9WAiWFzKuttT//KhPYyJFFJUzFxiMYae1xcbmAB4iy9UjwTI/3d6wNo7w58KbJKI/LVt1HBVv4Iilt/FJOCvfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUAf1I4g; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c7cfa17fedso54021845ad.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453610; x=1784058410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mr3RDiBFqeIYTx2r/qE+kwdslKLjgblCNaiBX5VWqtY=;
        b=rUAf1I4gs+zeHsPy5088BFhUq6TfuEAQMjAgNJAZltmuKkEVtTEJ7Vx16FIbRxS+Wr
         35A7N56teI0bfmQSqxqhvMh1lZ4Mq8crCGv4pBu+y6upka7+hkYvU9c2RhLbntY1aCFh
         kCnAesWi3bpEhVbVvB6qFJdhdgzPa+zFKnRnoIRjBn3fKy/yb7nrydku//ff/VS2xdZN
         ITPGJBqZyzGOi1BEloMUkoSiLb3kjN7VX4qFtK/lkByAuNa7m+a07YAThPyJSY5rjfmQ
         Prv0t2N5nJOZ9kTuSvDrsQsCcdkZkTaOo5b15HTC4Cxz9GYxR25W0iz+VrdcOfQFgC6h
         fbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453610; x=1784058410;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mr3RDiBFqeIYTx2r/qE+kwdslKLjgblCNaiBX5VWqtY=;
        b=Kve9bBojBBNByOWpk5BVmQnGZJQ2wfcvWSvw0eOoUzL0JsXQ6id6tOGp0Az/f556Io
         MYKEKZwRfPoWDV9WwtAU10tG3BTgzNI/UK4CENSBTIqx+PCDE+/Hp/UZqGzYrBLlOG0O
         Fo/Kp8LjE3rhM/DGERotq5f4CZba7QceIJkSCoRDCOrxShEMmhxD/UuTkJ9w938v7KuR
         d39RusZlvpbOlA1HwcLuoT8JSYsRVeUC81BbvaNBFwADoheN05iBboHLO8QxaRqPaEti
         bXVjCZKmLpwH2PO1i/GYR43h51hL+ZLamzcSMSDd2bTVc+UvzIzxwHjdsRK2lzKYCIIC
         MUfg==
X-Forwarded-Encrypted: i=1; AHgh+RqacH8vjaSCGKHXOz4wBORGkLER4exj5spVTbF4J4STnzlwcsKl733viYzipuQDiuRaVhjD+HUY5Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdM5Nt3vWq03ZKiD4rI+CLjplE9a+JajwpuMEKMm5192liZyV
	fr+AQdmBJ3Psg/Pu568jAZDyQKyHMqd9/L51mC9LTZ1MivNCNlGJ/oan
X-Gm-Gg: AfdE7cnSbNpCAph3vrbpahVZE10tJ7Jct54jKdNoG8P32WETSBXVApTsjf5uWtYzuID
	k9Nd1+aQoIElysxjbb9xrnGZHmdki6m+weSY8WHTs8XizLcWZZweibTqLYIPe73JSpmlDlxGZor
	lVUpfu2P9xUclaH8Sft53NjrsfrL9ywu9063+2H8Hs7LwS/4PLuJXrhIbZQy7if5/CT2RxQGu8b
	tPRH3RAswFR8YYAN4IF9rrLtdZGuCCnsl6IG4rcXkVap3SuT+Rrw3X8POQU6/KZ77ESIJl39Z+Q
	fpEs66yMFtafR+2RBXm3mnN31kUj3NpaXaQzZTkoB5Rn7YJ1tKNfR7RwvWibr9Eskh0BnPvoZ9J
	r079/3zRr83LEF4lecxb8xZswVAqlLlibsB+d+jchD0LkJglE6ezkCvjBDUsxQJvubtbbIl6pgX
	oKoeKEF42DeE9qVgGvbpMR8Y3hn9HZ6E+SkvOytztp7eQwLtm+VB1LmbmAt1A=
X-Received: by 2002:a17:902:d490:b0:2ca:ef4c:e553 with SMTP id d9443c01a7336-2ccbe40b1d7mr62952355ad.3.1783453609639;
        Tue, 07 Jul 2026 12:46:49 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb86bsm17316425ad.11.2026.07.07.12.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:46:49 -0700 (PDT)
Subject: [PATCH v7 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Tue, 07 Jul 2026 12:46:46 -0700
Message-ID: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95470-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ee.iitb.ac.in,linux-foundation.org,lwn.net,kernel.org,microsoft.com,ziepe.ca,infradead.org,amd.com,redhat.com,linux.intel.com,suse.com,lists.freedesktop.org,ffwll.ch,linuxfoundation.org,google.com,suse.de];
	FORGED_SENDER(0.00)[skinsburskii@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:akhilesh@ee.iitb.ac.in,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:dakr@kernel.org,m:david@kernel.org,m:decui@microsoft.com,m:haiyangz@microsoft.com,m:jgg@ziepe.ca,m:kees@kernel.org,m:kys@microsoft.com,m:leon@kernel.org,m:liam@infradead.org,m:lizhi.hou@amd.com,m:ljs@kernel.org,m:longli@microsoft.com,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mhocko@suse.com,m:mripard@kernel.org,m:nouveau@lists.freedesktop.org,m:ogabbay@kernel.org,m:oleg@redhat.com,m:rppt@kernel.org,m:shuah@kernel.org,m:simona@ffwll.ch,m:skhan@linuxfoundation.org,m:skinsburskii@gmail.com,m:surenb@google.com,m:tzimmermann@suse.de,m:vbabka@kernel.org,m:wei.liu@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skinsburskii@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[skinsburskii:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A80471F65D

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new helper function,
hmm_range_fault_locked(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v7:
  - Replaced the unlocked HMM API with
    hmm_range_fault_unlocked_timeout(). The helper now takes a timeout in
    jiffies, with 0 meaning retry indefinitely.
  - Moved -EBUSY retry handling into the HMM helper for the unlocked path.
    The helper refreshes range->notifier_seq internally before each retry.
  - Switched the unlocked path to mmap_read_lock_killable() and return
    -EINTR if mmap lock acquisition is interrupted or a fatal signal is
    pending during retry handling.
  - Removed the redundant non-timeout hmm_range_fault_unlocked() interface.
  - Updated Documentation/mm/hmm.rst and kernel-doc to describe the timeout API
    and the intended caller pattern.
  - Updated the HMM selftests to use hmm_range_fault_unlocked_timeout()
    only, including coverage for the finite-timeout path.
  - Added in-tree users of the new helper:
      - mshv
      - nouveau
      - RDMA/umem
      - amdxdna
      - drm/gpusvm
  - Preserved each converted driver’s existing timeout convention:
      - unbounded retry where the old code retried indefinitely,
      - HMM_RANGE_DEFAULT_TIMEOUT where the old code used that budget,
      - existing driver-specific timeout return values such as -ETIME.
  - Used max_t(long, timeout - jiffies, 1) when passing remaining time from
    absolute jiffies deadlines to avoid unsigned underflow while keeping a
    minimum one-jiffy retry window.
  - Left callers on hmm_range_fault() when they already need to hold
    mmap_lock across surrounding work, such as drm_gpusvm_check_pages().

Changes in v6:
  - Reworked the new API from the external int *locked pattern to
    hmm_range_fault_unlocked(), which owns mmap_read_lock() internally.
  - Changed the dropped-lock contract: hmm_range_fault_unlocked() now returns
    -EBUSY when the mmap lock is dropped, and callers restart with a fresh
    mmu_interval_read_begin() sequence.
  - Kept hmm_range_fault() as the locked variant for existing users, preserving
    its caller-held mmap lock contract.
  - Added an in-tree user by converting the MSHV region fault path to
    hmm_range_fault_unlocked().
  - Updated Documentation/mm/hmm.rst and kernel-doc to describe the unlocked
    helper and retry pattern.
  - Updated commit messages to match the new API and return semantics.
  - Kept the userfaultfd HMM selftest using the test_hmm unlocked read ioctl
    path.

Changes in v5:
 - Rework hmm_range_fault_unlockable() retry handling to retry
   VM_FAULT_RETRY internally with FAULT_FLAG_TRIED set, matching the
   fixup_user_fault() pattern and avoiding repeated first-retry lock drops.
 - Distinguish VM_FAULT_RETRY from VM_FAULT_COMPLETED: retry faults now
   reacquire the mmap lock internally, while completed faults return to the
   caller with *locked = 0 so the caller can restart with a fresh notifier
   sequence.
 - Document the two *locked return states, including the -EINTR case when a
   fatal signal is pending after the mmap lock has already been dropped.
 - Update comments around HMM_FAULT_UNLOCKED and the HMM fault loop to match
   the current hmm_range_fault_unlockable() implementation.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).

---

Stanislav Kinsburskii (8):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      selftests/mm: add HMM tests for mmap lock-dropping faults
      mshv: Use hmm_range_fault_unlocked_timeout() for region faults
      drm/nouveau: Use hmm_range_fault_unlocked_timeout() for SVM faults
      RDMA/umem: Use hmm_range_fault_unlocked_timeout() for ODP faults
      accel/amdxdna: Use hmm_range_fault_unlocked_timeout() for range population
      drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst               |   63 ++++++++
 drivers/accel/amdxdna/aie2_ctx.c       |   17 --
 drivers/gpu/drm/drm_gpusvm.c           |   52 +------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   11 -
 drivers/hv/mshv_regions.c              |   54 +------
 drivers/infiniband/core/umem_odp.c     |   18 +-
 include/linux/hmm.h                    |    2 
 lib/test_hmm.c                         |  111 ++++++++++++++
 lib/test_hmm_uapi.h                    |    3 
 mm/hmm.c                               |  246 ++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c |  220 +++++++++++++++++++++++++++++
 11 files changed, 613 insertions(+), 184 deletions(-)

--
Signature


