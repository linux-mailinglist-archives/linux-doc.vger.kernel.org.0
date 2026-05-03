Return-Path: <linux-doc+bounces-85547-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGGHES8z92mWdQIAu9opvQ
	(envelope-from <linux-doc+bounces-85547-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 13:36:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65914B54D3
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 13:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04067301706A
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 11:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6B1345CCE;
	Sun,  3 May 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Vb36txbh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B072317142;
	Sun,  3 May 2026 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808138; cv=none; b=SXzY9CjQrtM6YHySbcVn0QzGfYTuItzsYS81Guomwh9BRZC47c7FPA7TEBFLzVlDo9HquDGgIT/cn8ty39aoVQ20HVS1E+D8VcoC2v+4DqH+doloOchwpeNgQWWJyejrcSB1Ge+Hx/XS7ZwYGY8u0mwE8ZtCfTvZQJwH85EERkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808138; c=relaxed/simple;
	bh=YwcNdtJ5dZGo3c0u2URHnkbVwr2tYfsy9Y/UmIt/bzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQz5UFD7Cxzwm5Fd49pkDD++tBwBnOC87uOjJKfRM44Sbfl1fuiCWdThZZMhM7ycTIOWrDj2+HHkFpxwlOiKS5UEFXcyVSvZ1s+JbPjP2k6xJsEqcfIG5zAQZrYaaGZ++9PSb4YSh3VBcuouamY/9z3DskX7j/Uw63muZFy97es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Vb36txbh; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777808135; bh=3YQeG63cxUBIcGGm2uCmzofjGBM+wDHMp4UdcZEVSr4=;
	h=From:Message-ID:From;
	b=Vb36txbhW2FR8uAIrlHc7ii2eRjRTLJQuoryGi7sCnKMZI4MWt0J/6tJr3OzdmZjy
	 7YGXgjk4iD4rWy29VCaUvYPCMqEXk3PG3q+2G3QyYKxRnlPIMnKvjKw79XSSejZ00Y
	 tzGVIlHq5E30c55HPZKGoeifQFOv9Ls/j5qSb/B8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 16B03C0A41;
	Sun, 03 May 2026 13:35:35 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 0/3] Documentation: security-bugs: new updates covering triage and AI
Date: Sun,  3 May 2026 13:35:03 +0200
Message-ID: <20260503113506.5710-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B65914B54D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85547-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[1wt.eu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1wt.eu:dkim,1wt.eu:mid]

This series tries to translate recent discussions on the security list
on how to better handle reports. It details:
  - when not to Cc: the security list
  - what classes of bugs do not need to be handled privately
  - minimum requirements for AI-assisted reports

As usual, this is probably perfectible but can already help in the short
term as we can point it to reporters, so barring any strong disagreement,
better continue to proceed in small incremental improvements and observe
the effects.

Thanks!
Willy

---
v2:
  - fixes for issues reported by Randy
  - Greg's ack on the AI part
  - reworded the "when to Cc" part based on Greg's feedback
    (Greg I didn't take your original ack since the wording changed)
  - split the threat model into its own document as per Greg's suggestion

---
Willy Tarreau (3):
  Documentation: security-bugs: do not systematically Cc the security
    team
  Documentation: security-bugs: explain what is and is not a security
    bug
  Documentation: security-bugs: clarify requirements for AI-assisted
    reports

 Documentation/process/index.rst         |   1 +
 Documentation/process/security-bugs.rst |  93 +++++++++-
 Documentation/process/threat-model.rst  | 231 ++++++++++++++++++++++++
 3 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/threat-model.rst

-- 
2.52.0


