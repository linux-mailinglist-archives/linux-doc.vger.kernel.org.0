Return-Path: <linux-doc+bounces-91955-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xCsiAmTBKmoxwQMAu9opvQ
	(envelope-from <linux-doc+bounces-91955-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:08:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99903672988
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:08:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=1NS+8VZd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91955-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91955-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18356308AAF9
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 14:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3773F9F58;
	Thu, 11 Jun 2026 14:07:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262B40861F;
	Thu, 11 Jun 2026 14:07:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186831; cv=none; b=mx3Sw6lZRuS3BOb4vyOoYv0+omk8SPArR73IHH2r+0GrLwqGzVKPxIXV5KJmBqRQH7Auwz95E/WFej5xbrrfjw3hX3jXIk8/vYcRR1qHXAjgAxnokJOwDfK/4e/kV6uJydHZuD3Oev7xDjv/rjQ6dUaP9hd1KgiCyz3u+YpH350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186831; c=relaxed/simple;
	bh=a2WBTqoUIIvn4Xa5LiibHEJAjYFhZrUn7vnSweSdeQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j14eQwbpY9T5Dn2FXL7yeClwMgCTzI01e1dGF73o1/7rV9+w9s/5OVsBqGCBDQE2CG9+ChI1R7c59yUHJdGX5edtPv8PcQCufCYAVBbSiLBfQcV3jwcRK/qEJGQFIgx+u7P5U0ozvNqDWLmnFrEJE5m31v2kGYztV/BQFK92qUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1NS+8VZd; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9VtyOjaZ0Hskv/gtSPJhdSSJlDhoOI/Y4g/ssy8U7Zw=; b=1NS+8VZdIfQK8/+aqQzh/ffpuo
	w0pNHvlh+GG9vUpovZlYcs67QB4U2iYHIige9SG+mgLvVbPXLOKF/r13iT4sIu5aCzclz8s82iz4i
	GbPb0DadkcpPEyKKLsk4Mee0IBoCdb3ukN76dUQwhsCjlrY7T0d7dxTemWk22ay9em7J5c1vBwISH
	nW8oq4Ekvqd+nnts7s3rtzJNqdD1zQXoqF76V5sZ3X0WZELdaBofCD92S/UzIxVEQl4RzFXH7oHvW
	xiZu9Wrbo0iISeF2abKhsL9IbMR+P1fE41gp8tGUCJJtdL42wW1A3JBYDXkahRKZ4YGifbTLlLmMI
	WubetdRw==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg3o-00000009ZXf-1Roz;
	Thu, 11 Jun 2026 14:07:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: configurable block error injection v5
Date: Thu, 11 Jun 2026 16:06:43 +0200
Message-ID: <20260611140703.2401204-1-hch@lst.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91955-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:from_mime,infradead.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99903672988

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

Changes since v4:
 - don't unlock in removeall to avoid a race between removeall and setup
 - document why we can't match 0-sized bios

Changes since v3:
 - use a static branch to guard the new condition
 - split out a new header so that jump_label.h doesn't get pulled into
   blk.h
 - more checking for impossible conditions in blk_status_to_tag
 - more spelling fixes

Changes since v2:
 - improve the documentation a bit
 - fix a spelling mistake in a comment

Changes since v1:
 - drop the should_fail_bio removal and cleanup depending on it, as it's
   used by eBPF programs and thus a hidden UABI.
 - as a result split the code out to it's own Kconfig symbol
 - various error handling fixed pointed out by Keith
 - documentation spelling fixes pointed out by Randy

Diffstat:
 Documentation/block/error-injection.rst |   59 +++++
 Documentation/block/index.rst           |    1 
 block/Kconfig                           |    8 
 block/Makefile                          |    1 
 block/blk-core.c                        |   87 ++++++--
 block/blk-sysfs.c                       |    5 
 block/blk.h                             |    3 
 block/error-injection.c                 |  315 ++++++++++++++++++++++++++++++++
 block/error-injection.h                 |   21 ++
 block/genhd.c                           |    4 
 include/linux/blkdev.h                  |    6 
 11 files changed, 490 insertions(+), 20 deletions(-)

