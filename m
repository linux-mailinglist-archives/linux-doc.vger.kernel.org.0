Return-Path: <linux-doc+bounces-96825-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hNfEEWqYVmrM+gAAu9opvQ
	(envelope-from <linux-doc+bounces-96825-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 22:13:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDB758A5D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 22:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k6lFJE3e;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96825-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96825-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D761302A342
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE13541A91C;
	Tue, 14 Jul 2026 20:13:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E37423EAD
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 20:13:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060007; cv=none; b=KhES2a6g9qmT7VK5/hMlgL6CxNzYga3FKsCseA9cRk8roY4mDIgirU0iKRq+9yhtPkKp6OxrSqY6B3Sn1he+y3UKfnaN6wFpMhnpFCFJGcl5klbxXSXR3hV0B7nh8LwRQfGrNDdHKVXt7XW/zWHFz//eET6t/vvqC8e1vJL7Jbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060007; c=relaxed/simple;
	bh=M3iXyfmpsqnLTOm4C9JQljZWWPFlOSzSAIkxUKB+CuM=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=o1QDf4HVP9UV6dPhWRM1v3GqlS29UCKo1AEo3OCNL/Drb1ilNNbkpK5jFoniVkBSB/h9099uAmFR/ytNxrkEUWlH+w+JGShB5l18HkpNwSAIS75tGZy5yFpI17Q1ejRsNrZGVBBcF6z9tiUWwviLKBhXfgUjp3cU81jyim0H2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6lFJE3e; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3812770b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060006; x=1784664806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=k6lFJE3eKj2hmZ3Yy4wyePNrZYKYIgZz5P/UI4UA4IKlS0oB/+8bq4IoSuCCLwsHuJ
         IvQtFLkaoFqtMUobJ805Gtn6+BUGYQGBpeb2Y9opKbcnf8j/VqD/DnsqnPHFsvHSX+wx
         zRVn0rE2MoUlWf9mAKT/c4YdzI2R/np9m3yAB8BtLfL0J5qt+1fd4JrwaP1xwUJGXewj
         oFbEKm350y+MYJ53a3oMAdOTEjfNhoTLIuUyB5N3z7wRAWQZ0ZX+C2WHEIaC5A4/hrAd
         En3W/kTVRnX/IOTcPCdHH0Pu11FyFyXpK7ruyXY5/bJMSEwwD/z9XKH/yPs6BpIUzQhQ
         Z3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060006; x=1784664806;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=ZuKuqMn+f9rPVngWdbgO4u4uLaxoK+Uoj27e+WGFeYds7IZZVwu03+pF8WzXA1KWHn
         EH2VnWseAdPe6PGKHPLcO0JuOv3q1mR7OVudSazS2yUCV5MG+Z8vxmJ6Oq4AXg4ALb1Q
         IsmVm0fDgzEecJ+e6GpCQEsXWnxDeDVo6FAl3UnTj1Z0qeBknmJzk9pVrotjJ1USdTaq
         RcIu8MuI76xiwwFhCrPvIfEWYPuUmqQmzVS6EwKGlj3riamKrwjoQDlkpJfwpY50RMWd
         F5BNqGgvNB5cYuyH59JfHs2LV3RHV5lzG6B+kt7i8H1rzTDnJtlqKtWhp8e8lXgIUuz5
         e55w==
X-Forwarded-Encrypted: i=1; AHgh+Rr0y9v+ruVg2ojiAEsIaVl31uQz1PQkwmdmE9Qz7OCNisBe36pzasvjAtzXmv4bD+chAfZDe3SNOcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtr5Kb0ydCmBdlyY5Iq8pEPdWFK5pzX9ZuxeUtmuOwAOM7ZiLz
	tfnfpnh8fYAnUk5p7FHuqO4Nm725HVGn1COXDJCyBxrC1fglmQ9VTKzp
X-Gm-Gg: AfdE7cnAvtrFryc5HryY/m1oeic5tyVJt33+F6/kkHnYWgmAt5Djk13YQ2q5IUA8Ybf
	VdD8lTSccbhhQPf5WUw/dqnEAfpWrGyMhnyrzZLfcasaaG/NZpIcQ6FIjSYaJgaQBiN3IXa/qz+
	JjEAoplpcVkCjLgDT+28EAEzWm0D/WlhRXyPxFeALhEu1NgK4Az82VrHXbkz63pzJ//qzx4bES/
	xxcsACZiJo+jIdqi4+Z/xuja3093I9ObX2ZlHj+ZIFdpXIZgJdqnQ1fJNqaw3FmNmkMRv/5hnrL
	imgOz8GnRy1kZJDCvDXlC9hemV28nwuLIKUlnmD+Z8kRVsxJTu9RGQkBFDj2NPmQs1B9BE/oIjK
	cNZGO8wJ2WOR117arN4GBqf8Q5zVwDOZCUlI3qs0+QaWMbRaYVcQSV2T72YsNIHE8ICA260nkXk
	inZjVUU5qAR9aXbXxQk+C8P3WXUJbrnT5ehS3tKapJtIeTMt+CfnSLb4nbMPhutCLl85e3fg==
X-Received: by 2002:a05:6a00:1f14:b0:845:e9e5:cdec with SMTP id d2e1a72fcca58-84a559bb7dfmr3412771b3a.62.1784060005776;
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dade0sm1998127b3a.46.2026.07.14.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Subject: [PATCH 0/4] mm/hmm: Clarify notifier retry state and scope HMM
 timeouts
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 13:13:23 -0700
Message-ID: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:akhilesh@ee.iitb.ac.in,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:dakr@kernel.org,m:david@kernel.org,m:jgg@ziepe.ca,m:kees@kernel.org,m:leon@kernel.org,m:liam@infradead.org,m:lizhi.hou@amd.com,m:ljs@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mhocko@suse.com,m:mripard@kernel.org,m:nouveau@lists.freedesktop.org,m:ogabbay@kernel.org,m:oleg@redhat.com,m:rppt@kernel.org,m:shuah@kernel.org,m:simona@ffwll.ch,m:skhan@linuxfoundation.org,m:skinsburskii@gmail.com,m:surenb@google.com,m:tzimmermann@suse.de,m:vbabka@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ee.iitb.ac.in,linux-foundation.org,lwn.net,kernel.org,ziepe.ca,infradead.org,amd.com,redhat.com,linux.intel.com,suse.com,lists.freedesktop.org,ffwll.ch,linuxfoundation.org,google.com,suse.de];
	FORGED_SENDER(0.00)[skinsburskii@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-96825-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,skinsburskii:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8EDB758A5D

This small fixup series applies on top of:

  [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings

The first patch updates the HMM documentation example to make the
mmu_interval_read_retry() state explicit: callers should use the notifier and
notifier_seq stored in the same hmm_range that was passed to
hmm_range_fault_unlocked_timeout().

The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
HMM retry budget. These callers no longer keep an absolute deadline around
their outer driver retry loops or pass a computed remaining time into HMM.

This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
HMM succeeds and the driver later observes an invalidation through
mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
retry budget.

---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
 4 files changed, 23 insertions(+), 45 deletions(-)


