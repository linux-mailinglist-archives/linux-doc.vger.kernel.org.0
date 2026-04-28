Return-Path: <linux-doc+bounces-85030-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPKoF44w8Wn7eQEAu9opvQ
	(envelope-from <linux-doc+bounces-85030-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 00:11:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A093648C7B0
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 00:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 621FB302F72E
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 22:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EC237700D;
	Tue, 28 Apr 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1p0yhlM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF964373C13;
	Tue, 28 Apr 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414283; cv=none; b=HlPK8PAOMrCfhES1ckvjk8oZJ+3wIQnejj/XAmQzcPIlBFOKkDbw9JZpwkS6z9oJg5BzImG+xH+rpRPUzri6yJxZ+6cQhU+uURBP/OaXLoe7GcLaN4wo7vgrAH/at6dOQc5TJ7i2aD+ZYmxfVKJN75yezJ60qNg4V5CN/y3YQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414283; c=relaxed/simple;
	bh=KO25byLjS3kq8Wtgw9TvyHDCbLGnzQOZ1aKBxXn9sDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlDldpyK1cyAgYUwn22zmqu1HqfjNSQI0tlcDasaRlMw02/C1KbVQi8iE4codfaVA2MJAVA8AnxX9hMIWmU8AKAuq15dmcZFQaS2vQmg0euj91XU5QrmRUPPCcxrYpKL4F4rkf8qcsOlqN0G8dnkswEtg7cupLr7P1wlqJrgY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1p0yhlM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5E3C2BCAF;
	Tue, 28 Apr 2026 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777414283;
	bh=KO25byLjS3kq8Wtgw9TvyHDCbLGnzQOZ1aKBxXn9sDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1p0yhlM+keicgFWYclQr1WCP8IWirQ+o5ZjIWtH4cIV6t+SJB4KMDROWYXr2Vj/2
	 qpWfpq8Ug6dE5k/oG74O10POM6ymyenXf5eHFKYjhTf3PkAXxEmQkHTMmtTPovjRDC
	 a+srHJ2euU72HiGZkngljklmhqDjc5vJExkr5xnF9Kt+y7v1Uqg3vx13yZlK3ti+Wh
	 ajDs/zMRfaMf8PqP/JHXOzVxSR3NADzvCirJdRHKyeXc92P2qMVBQVHoRRFyEr7YXO
	 AFyzLqgotOPM4iRFA02XhMrQsnYeHnCQM9MFEjAXBIVDFqJZI+kY8j2vhfd/js04ka
	 ViOSiIyTNSXNg==
From: Danilo Krummrich <dakr@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] Documentation: update deferred_probe_timeout cmdline parameter documentation
Date: Wed, 29 Apr 2026 00:11:18 +0200
Message-ID: <20260428221118.2686159-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260416144144.54547-1-johannes.goede@oss.qualcomm.com>
References: <20260416144144.54547-1-johannes.goede@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A093648C7B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85030-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 16 Apr 2026 16:41:44 +0200, Hans de Goede wrote:
> [PATCH] Documentation: update deferred_probe_timeout cmdline parameter documentation

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] Documentation: update deferred_probe_timeout cmdline parameter documentation
      commit: c9447f101315

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

