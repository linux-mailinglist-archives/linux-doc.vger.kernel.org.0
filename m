Return-Path: <linux-doc+bounces-80354-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOwODs5gvWl09QIAu9opvQ
	(envelope-from <linux-doc+bounces-80354-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 15:59:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F18E2DC2C5
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 15:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEEBE30A8205
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 14:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC7F3C1417;
	Fri, 20 Mar 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Unnq69Ql"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936E383C7C;
	Fri, 20 Mar 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017933; cv=none; b=M71b9hBfzqLjWy239k8O5Dfo5B4SL8u3+bhB1UfcUR9I83hyFcM8W5MMbVAkZuypsj7k4XLIIjNsBIWEnvgahQL1Bn4OSpwLWhXHCLE41xDKy970ZE0ZQXQZpA8YP9hqF1Nt8K/MVAUhCoESot6LJpd9CzcyggjN32nEig/jYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017933; c=relaxed/simple;
	bh=myZR/UnlE+SI0oy9BRK0X+Y9scyat+qDRsNLHUTyFWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J81MqJ4pjzT00J8syCggWX19rY8SG0T8VdIm+AJVR6FrpPHBfR9cQpnlYVboR7mHUlgiePI0zldY0z7Ilr+mUkoLOdck4WWO79L8tFBc8+K0k8zpg8e1bmy2Oroswj4OYOmMSztY8hONvTb0Q1MFlE04gUdYPNOITKmM8N9LsdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Unnq69Ql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2451FC4CEF7;
	Fri, 20 Mar 2026 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017933;
	bh=myZR/UnlE+SI0oy9BRK0X+Y9scyat+qDRsNLHUTyFWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Unnq69QlXqH2oNBMdgOndbbuJ58+x6JSFqTk9uQ5zb89qOF3njkhcNNjP9kWH+4ld
	 ER+pquzrTBUyXfL0XtbdK23k4XZTfLw24qqTlJVWB3tqgpoju6RRUjjCqibSy59Rv+
	 RoyH+sof7UukWsTxLUa0g7CCu7l2aq28AjIYyWoiIyI78nl0f0/Hyj0i4rYd5ytL/K
	 DBzQhCHFIaHNo7MZgs+d5R6PTQDNd5Bh2Zn/G1sG439Lt2cAnZjXSOXc/eGI0DbhWw
	 Pjy+kLZcHDB/+ij0Cba1zBo7wMa+UDIViAFIYfDbWPmw87NL7A/gBWJcz/wzjFkelD
	 UIJFloVOLqhqw==
From: SeongJae Park <sj@kernel.org>
To: Liew Rui Yan <aethernet65535@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Docs/mm/damon: document min_nr_regions constraint and rationale
Date: Fri, 20 Mar 2026 07:45:29 -0700
Message-ID: <20260320144530.91737-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320052428.213230-1-aethernet65535@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80354-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F18E2DC2C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Liew,


Thank you for this patch!

On Fri, 20 Mar 2026 13:24:28 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> The current DAMON implementation requires 'min_nr_regions' to be at
> least 3. However, this constraint is not explicitly documented in the
> admin-guide documents, nor is its design rationale explained in the
> design document.
> 
> Add a section in design.rst to explain the rationale: the virtual
> address space monitoring design needs to handle at least three regions
> to accommodate two large unmapped areas. While this is specific to
> 'vaddr', DAMON currently enforces it across all operation sets for
> consistency.
> 
> Also update reclaim.rst and lru_sort.rst by adding cross-references to
> this constraint within their respective 'min_nr_regions' parameter
> description sections, ensuring users are aware of the lower bound.
> 
> This change is motivated from a recent discussion [1].
> 
> [1] https://lore.kernel.org/damon/20260319151528.86490-1-sj@kernel.org/T/#t
> 
> Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

