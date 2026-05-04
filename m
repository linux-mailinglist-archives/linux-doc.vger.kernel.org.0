Return-Path: <linux-doc+bounces-85762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOL0OYot+Wkq6QIAu9opvQ
	(envelope-from <linux-doc+bounces-85762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 01:36:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B774C4E0F
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 01:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E97B3006B28
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 23:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D8D3D6475;
	Mon,  4 May 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jt/3n///"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EB386C05
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937789; cv=none; b=qIQXkeDxVlr/9srV9Y7VkoIUsHwEQt1jRXNpf2z/1V2hNFYuvEOhOsrKuLP2rNsyAaUYSJo+287P9pVBPL6qzg7kQAgc3D29XW+yNnOYJ8KP7YD4ZP0gWT3TwVSKR6XAUs3keePQHVfIZXzFWvuS1t+nZqgPJ1Ef47LT9TeFfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937789; c=relaxed/simple;
	bh=tJeULi/q7xpYupoBRYwHRPzDC/aOPztVImhVoaMF02s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ok5h/E2GWo5hyzBNzlY4YNI77fF+ljlETJ0uvo9/FmhAO5SjJEt3zsIGa96NRy5UkufFmD7ZIXlbG3o1wUzGAnZud0GqrOwTXEk0CBKOhDurywCsviyuG4TM1XEEWHuv7kJnWn5jBUciDiDBrAwBO2x0xfbNH2tCReSzXCgD2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jt/3n///; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2cc75e79b97so9758735eec.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777937788; x=1778542588; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6SVtzc1b2hNmp2ps3pkK8pPFTjVWAOuceZgJhvLk1yE=;
        b=jt/3n///JL1V3HB0AEJjNORk6+ipqjfiym711zZyoGNHUwO5CAVTYftWxEyQYPeEbI
         2CaOpuRqBRwf982bq8UZxYzKVDJe7S8GqnhjsId92ESiUopMQRGcJw/sL1t0ZW0BBl3M
         OUUe8EZcfIprqggU3fh7QKMvxdO7WwjYbK6W2z3cYtCZnsQ0llW6vfP82xXxj66k3aDd
         zUhJgpQCivDR9hK9vTM/8oUj2d+TmaL4oZ1iW1NEsy6Qb/Mt8QGODkP7Ou+0TL+cEPg8
         yNyAddqZYyjoznNfIRbG94xX/xy+xqDYJbRfuPqk7zpL/ZGybYaZTad74yaJesq/JVmP
         RZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937788; x=1778542588;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SVtzc1b2hNmp2ps3pkK8pPFTjVWAOuceZgJhvLk1yE=;
        b=P6SlPstBDyqSd1rX9JWzgS0sE0629EcIfZkxc6KRxJ3I5TYk6OCOTnFjAw0z2BLg2L
         uK8vHrQQPajky1poUnFdQSvQjC8D7vS5QVfA4huewmPOlQg8G7p+JGzari5gg/liCjS7
         TcTPmYq3cbeVxOwZJMJiP+dVmGxtrU/sKJK0+w38c8VZPGC82aGNP24sbIhD9INkOMBL
         Qqn/3PaJwKg8JSH7+21/TYwS3sA/Prwy8sYmMMFBKKtLNytEQqJFgzcJZU2D76tD4NUa
         0htG5WTaBbo+wg2ve0rnQ2vDduUoi5BZsESvIbcc5yBracQ3wHEvsi0MwE/R1IlswSQL
         5z0A==
X-Forwarded-Encrypted: i=1; AFNElJ8DfP7CS0zQmEHQnvuxxNUxuMSyxGZ5kBGTBxSpgt0k0BdxmKujJVxWL+/ERNEDN6OpOPro+Y9kH5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOruqcbbOkrUVu2q63v7vW/wa/0f4WH94L1AfavkDParoUfB4L
	MfWDt8eC+hy/fRa/W0O09+FuYOJBsgvk4dOGx5W3gHNw0GQYcReCfUkRox5Zzn38qrjyNQbsjrf
	N9xXc7itiuyCWoTGRrEwIYOd7YL81rHCfhQ==
X-Received: from dybcr21.prod.google.com ([2002:a05:7300:ac95:b0:2e2:2088:dca7])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6592:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2efba5a4258mr4958847eec.33.1777937787455;
 Mon, 04 May 2026 16:36:27 -0700 (PDT)
Date: Mon,  4 May 2026 23:36:18 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <cover.1777936301.git.abhishekbapat@google.com>
Subject: [PATCH 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 75B774C4E0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85762-lists,linux-doc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishekbapat@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Currently, memory allocation profiling data is primarily exposed through
/proc/allocinfo. While useful for manual inspection, this text-based
interface poses challenges for production monitoring and large-scale
analysis:

1. Userspace must parse large amounts of text to extract specific
fields.
2. To find specific tags, userspace must read the entire dataset,
requiring many context switches and high data copying.
3. The kernel currently aggregates per-CPU counters for every allocation
size, even those the user intends to filter out immediately.

This series introduces a new IOCTL-based binary interface for allocinfo
that supports kernel-side filtering. By allowing the user to specify a
filter mask, we significantly reduce the work performed in-kernel and
the amount of data transferred to userspace.

Performance measurements were conducted on an Intel Xeon Platinum 8481C
(224 CPUs) with caches dropped before each run.

The IOCTL mechanism shows a ~20x performance improvement for
filtered queries. The kernel avoids the expensive per-CPU counter
aggregation (alloc_tag_read) for any tags that fail the initial string
or location filters.

Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
2. IOCTL Interface: 1ms (sys)

Scenario 2: Compound Filtering (Filename + Size)
1. Traditional: (cat ... | grep | awk): 21ms (sys)
2. IOCTL Interface: 1ms (sys)

Scenario 3: Size-Based Filtering (min_size = 1MB)
1. Traditional: (cat ... | awk): 21ms (sys)
2. IOCTL Interface: 14ms (sys)

Abhishek Bapat (5):
  alloc_tag: add ioctl filters to /proc/allocinfo
  alloc_tag: add size-based filtering to ioctl
  alloc_tag: add accuracy based filtering to ioctl
  kselftest: alloc_tag: add kselftest for ioctl interface
  kselftest: alloc_tag: extend the allocinfo ioctl kselftest

Suren Baghdasaryan (1):
  alloc_tag: add ioctl to /proc/allocinfo

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 include/linux/codetag.h                       |   1 +
 include/uapi/linux/alloc_tag.h                |  87 +++
 lib/alloc_tag.c                               | 249 ++++++++-
 lib/codetag.c                                 |  11 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 508 ++++++++++++++++++
 7 files changed, 865 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.54.0.545.g6539524ca2-goog


