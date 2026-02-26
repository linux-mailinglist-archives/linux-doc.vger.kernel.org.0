Return-Path: <linux-doc+bounces-77184-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHd5EXcboGmzfgQAu9opvQ
	(envelope-from <linux-doc+bounces-77184-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 11:07:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E851A3FA6
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B701300B988
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5F23A0EBC;
	Thu, 26 Feb 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="LMaXahdA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1C3A0E91;
	Thu, 26 Feb 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100317; cv=none; b=PsoVeC8+LYnJ9E81AWeb7cL2yITP33ntz9FxxvHBm9a32WIi9c9Mctd6bas0TiI4Zl2S9iUTEyZxyke+OtlJwJRtkSmZkTtDW2hLy5JCQ4oFss5pjk1WJ9jQbcPu5IeV1G6gfsZIVKkzIgq6A/bZdTSAFvnsu1iG1njN7n+hOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100317; c=relaxed/simple;
	bh=+mp1GZfpY+7A8iKfsDMVdpmc++VqvTaOxRKoUcjUPuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXdxYGui9B2t0GEBX3I5HcoUywSFxqqLLIEjFXgqSFlyMcrasfVAJeSUldwu0fg4JWqSbj4SUUde9FPE40u5RvOe2jTQ0MOSeizrlhSzV+sqEsWUrWQbbLV9ngwmwIEAkwmMGKYl0CzZF8vml1dXYkzGQnTjay6pdav81p7g9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=LMaXahdA; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772100304; bh=+mp1GZfpY+7A8iKfsDMVdpmc++VqvTaOxRKoUcjUPuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMaXahdAPoFFOy3ij+726ZHRsodYOWhsb3o0ipqQaPPV9VpnmdYJuFRYf0V7BbXe/
	 g9TRZHH0XEX/GCMOQ9f7rWugT33JUDBbfHhYafIZ6s14z9mCzENUki0LOgboRPDfPz
	 zaWhESQeksH+bvD1eL911d4uufLsGCu+is1pB7Ot/BkFbq3WhHsXRs+TOd24Bi0Q62
	 8AkHcqBUbINBzylGTWtaCLBZ0q5U5Shoo495fLStS31qQbflLzX61aHnlKlCIRTjVk
	 x4auuJV+NNhLZiYpdVg44TSPAT2rk9HDA5hNuzPTvvNg+s9KmTyS4pHos1yq/BtI3R
	 VhH5+TW7YhM9g==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH v2 0/2] scripts: workflow: sort ver_linux
Date: Thu, 26 Feb 2026 11:02:57 +0100
Message-ID: <20260226100256.40215-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221152113.28322-2-hansa@airmail.cc>
References: <20260221152113.28322-2-hansa@airmail.cc>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-77184-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansa@airmail.cc,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[airmail.cc:+];
	DM_SURBL(0.00)[airmail.cc:mid,airmail.cc:dkim,airmail.cc:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airmail.cc:mid,airmail.cc:dkim,airmail.cc:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1E851A3FA6
X-Rspamd-Action: no action

It is a pain in the ass to compare the software versions on the running
system (scripts/ver_linux) with the minimal required versions (changes.rst).

[v1] -> [v2]
split v1 into a patch series
changes.rst:
 add reference to ver_linux
ver_linux:
 fix path to changes.rst

Signed-off-by: Hans Anda <hansa@airmail.cc>

