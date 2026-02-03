Return-Path: <linux-doc+bounces-75110-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPjJEbFPgmmBSAMAu9opvQ
	(envelope-from <linux-doc+bounces-75110-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 20:42:41 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D721DDE363
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 20:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B46A9300E253
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 19:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCC4361DB0;
	Tue,  3 Feb 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP0XF5DB"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E989211A14;
	Tue,  3 Feb 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147757; cv=none; b=D6OxOD9ZT38QVEKR5rd4AeZn18OgZ56lVuz2xM8aAdQdAuDt626Baq9BYL8YlOQgv0plxAFWdUnPfYDAZEAfYUbpkCGIymmMkeYBcC42MdD+xmzBrD9FEMVdL4xm1GA9HPjOxBinw1ujw4/PYU0PiwEcUNoWVCWIbNAPsuGenow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147757; c=relaxed/simple;
	bh=omGdPkZjlEENWhUZfrQ0xyL1xjsdvFKFkXPOg4Sog+I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=e/OZF9cdaPiWh+RQ/MQ39Y6D07ewmxA2DYDkDFYUV5YUuSQs0clt9uGgt7+GIfBeLFQmWL+z4jTyGJg9mOJFsxrmIaWpm58aNuXtXWSrDvyd71Xgy8mN5+IwLsgUTtyfSAE/uEDx9P5CE2RcdZTYdqwfMFf8mxOnaNdXRsRCtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP0XF5DB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30A6C116D0;
	Tue,  3 Feb 2026 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770147756;
	bh=omGdPkZjlEENWhUZfrQ0xyL1xjsdvFKFkXPOg4Sog+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dP0XF5DB3xm10OJLOIB6Emsz5UQaQFeFWdbXbEpqpkncNAxnSuaIARbmpkheQCcZI
	 nY5TwtVJ8rRCdugL/QWuF9QqiqLNuydbq+F72l9STfRCxU2JvV+Til9c4Vd9oLupyY
	 gn1ls+LiYoi5w8I53FriVxAqbRNZoRP5ZrFXRItWe+D+YRMABJZN9MBT+tq4L7Y4n+
	 vz0i1aGvzpdvURl4Bwc/num7dUSiwWl7mz5WlUNjSvFucseCB0CAQ3AlI/UKWUz/PF
	 jgwZ6ZZU1OXukkWnwKq0iyVzbqfiwrynmuLFA83DYoglbvGa6RekVj0GD954VytE7a
	 9M+Vt0TFAo/AQ==
Date: Tue, 03 Feb 2026 09:42:35 -1000
Message-ID: <809f40c7439988711ebac2682efa4320@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lirongqing@baidu.com,
 rneu@meta.com,
 kernel-team@meta.com
Subject: Re: [PATCH] workqueue: add CONFIG_BOOTPARAM_WQ_STALL_PANIC option
In-Reply-To: <20260203-workqueue-v1-1-ccf163b83187@debian.org>
References: <20260203-workqueue-v1-1-ccf163b83187@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75110-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,gmail.com,linux-foundation.org,vger.kernel.org,baidu.com,meta.com];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D721DDE363
X-Rspamd-Action: no action

Applied to wq/for-6.20.

Thanks.
--
tejun

