Return-Path: <linux-doc+bounces-90451-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDivJDhuHmrEjAkAu9opvQ
	(envelope-from <linux-doc+bounces-90451-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 07:46:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD073628A86
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 07:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CA973010F0C
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 05:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF903921E0;
	Tue,  2 Jun 2026 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zdqLeg1J"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E176282F36;
	Tue,  2 Jun 2026 05:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780379184; cv=none; b=jXSxTJZnJh2nLhFAmoz2zhEn0GZfViHGGF3vI72aImfVqIYQKgfzi0tRwTnX7/Pn0bIMRZKNz1673Nhyg+xYAyIKMmOWXbueATyOfuxZDR+pfc+0naMyI6ZgRV7w6an5l/7PFqgjmbfP3ayjsNkTOfL4Vz9u2Kk9Zr0WCBPop1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780379184; c=relaxed/simple;
	bh=5Zh4o8d9xZ3t5kB8qx2a4i/NDcV5Cun5GSzCROliQrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L998W8qjJDDhrOnqhLhN4QP4igsIFnfKDDcbjQfoz5zRZrZvvJbM0m5NAjrLpacFIAm2qtTI70+Cq1+GCWARlvjQU6VnYmaBnsJMeJ9Puiir/rqhXqLI8+QBtcBiziZmCD50i7ARLi6iVlcKYQDPDgudWNz21WM6sm96UlxzmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zdqLeg1J; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=E30adyqLn+IiJjt+Q1MzJ7u3OAK9PgtbqIogKbfv/qw=; b=zdqLeg1JjYJbjZHRpopVFLkycE
	RYESlhgqom3wXjM7/T+wdXcYq0LgrAFdLXrmGI6+2pCHeQWKfixPgDnidYFF12ejDexuftdNXSlXH
	cHIAADxFvmjOChBvgQELpsBAsg6WhTP/z6+1Q6dlC61LiOuzGxX92jxTUMQMxfnXiKmLTG5nYGVpi
	h4k2uTgtKyVBEGIqsZwc6e2HyTPNOviswvFZhbq+m02dctiAE3PwIHQc9zuQZOamOfsJ1pnWGneee
	iy/la7VEXjVd5jXDAlQEW9qUSWzGiymtT8RaVr/La5yk3J1/vA5pHS5Nuk0wnRh8/3fkdwC9CuqiO
	WoDPWt+A==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHxD-0000000CL9M-3zc3;
	Tue, 02 Jun 2026 05:46:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: configurable block error injection
Date: Tue,  2 Jun 2026 07:45:32 +0200
Message-ID: <20260602054615.3788425-1-hch@lst.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-90451-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lst.de:mid]
X-Rspamd-Queue-Id: BD073628A86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

this series adds a new configurable block error injection facility.
We already have a few to inject block errors, but unfortunately most
of them are either not very useful or hard to use, or both:

 - The fail_make_request failure injection point can't distinguish
   different commands, different ranges in the file and can only injection
   plain I/O errors.
 - the should_fail_bio 'dynamic' failure injection has all the same issues
   as fail_make_request
 - dm-error can only fail all command in the table using BLK_STS_IOERR
   and requires setting up a new block device
 - dm-flakey and dm-dust allow all kinds of configurability, but still
   don't have good error selection, no good support for non-read/write
   commands and are limited to the dm table alignment requirements,
   which for zoned devices enforces setting them up for an entire zone.
   They also once again require setting up a stacked block device,
   which is really annoying in harnesses like xfstests

This series adds a new debugfs-based block layer error injection
that allows to configure what operations and ranges the injection
applied to, and what status to return.  It also allows to configure a
failure ratio similar to the xfs errortag injection.

As part of this the should_fail_bio is removed, as the should_fail_bio
function really gets in the way in it's current form, and the injection
of an errno which always gets turned into BLK_STS_IOERR doesn't make
much sense.  This required adjusting the bpf test suite as it attached
to this function as it assumed it to be present.

Diffstat:
 Documentation/block/error-injection.rst                    |   59 ++
 Documentation/block/index.rst                              |    1 
 block/Kconfig                                              |    6 
 block/Makefile                                             |    1 
 block/blk-core.c                                           |  128 ++---
 block/blk-merge.c                                          |    5 
 block/blk-mq.c                                             |    3 
 block/blk-sysfs.c                                          |    4 
 block/blk.h                                                |   24 
 block/error-injection.c                                    |  329 +++++++++++++
 block/genhd.c                                              |    4 
 include/linux/blk_types.h                                  |    2 
 include/linux/blkdev.h                                     |    5 
 lib/Kconfig.debug                                          |    6 
 tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c |    7 
 15 files changed, 507 insertions(+), 77 deletions(-)

