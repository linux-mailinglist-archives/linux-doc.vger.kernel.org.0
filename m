Return-Path: <linux-doc+bounces-86603-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNR9NgkD/2nf1AAAu9opvQ
	(envelope-from <linux-doc+bounces-86603-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 11:48:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 581B64FF09D
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 11:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8E15301A14A
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6E63612CF;
	Sat,  9 May 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="OdBTPDsE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE733C1B7;
	Sat,  9 May 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320133; cv=none; b=JILKsOd4h/TJITiPVa9gqUaO+oEars9h36tj1fI4EkP4jpgUc3taQc0Xy9N0YvwCeHms8VPkuI2ENB0tsD1Fa/wgyB5XPEbFXN8ix4ez5IaEFX74tiLiFHZ3s8BdKTE+yxaf/kpCtuCUgND8K1T1s5sYMZpKqP7QImQcV+HDG4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320133; c=relaxed/simple;
	bh=HxByqh5ErlGGwQirqI9mi2EGOSPvSDB1l73Om5QC6+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqxBR0jaNJUsakOmVN2qHcIj0UQSnahzAJia1eHb5on/NWZ6xzOk3MXQB+LvquQcZPxvXwpKfjAaxRUlrhICwjvhrLF0IHhTPkpd9pHbp80lOvzeViKbmV9aKPVqGw6mR00IaG5sQSITzUq2N5jh5gxV1Lbx2Xx6NBPcQHpzT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=OdBTPDsE; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778320129; bh=j/xpPVe6GbXNcjKt1Ebyt6y8xLm8OyxR1yVviZFWXgE=;
	h=From:Message-ID:From;
	b=OdBTPDsEObe79NpRH+g3kLf1CrLu6mCZsq3BM0iqIo13FKb/+JKtarEhQgb9MSoqk
	 X6Evg00IPvLnccNLlscxv67DWcyEYCWwaowS6JdxLdL3TSlsOLxRIZ8e/0claisnDS
	 zSFmcQVXeOwLu+4NazTFDgLcDqBoVPqX3YKJOviA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8697EC0A83;
	Sat, 09 May 2026 11:48:49 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH v3 0/3] Documentation: security-bugs: new updates covering triage and AI
Date: Sat,  9 May 2026 11:47:52 +0200
Message-ID: <20260509094755.2838-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 581B64FF09D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86603-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[1wt.eu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1wt.eu:mid,1wt.eu:dkim]
X-Rspamd-Action: no action

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
v3:
  - comments about choice of words and option enumeration from Shuah
  - AI is public, from Linus and Greg
  - added extra reviewed-by (Greg, Shuah).
  - Leon, I kept your reviewed-by since changes are very minimal and
    didn't change the initial spirit.
  
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
 Documentation/process/security-bugs.rst | 105 ++++++++++-
 Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
 3 files changed, 340 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/process/threat-model.rst

-- 
2.52.0


