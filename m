Return-Path: <linux-doc+bounces-78192-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPE6JgryqmncYwEAu9opvQ
	(envelope-from <linux-doc+bounces-78192-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:26:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C79223C31
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C88F43040222
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 15:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304C939F19D;
	Fri,  6 Mar 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9JBNXIQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1F395DA2;
	Fri,  6 Mar 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810723; cv=none; b=ary91tUpjHe1dwPMKMfovAbBpd/z3MCa7/5bvuUp+fbeoktSA4wsT7kd5lkxbjUkw/PUSStmUc3B0sxtpPxh6zvVAhDqFVDkQz0kOT8xUR6H0ntPkJ23bvIgXM522He5gSZ9mSR9BFp6l2X8ipmYrGCSj1ELKRr9wOKtZrO6C84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810723; c=relaxed/simple;
	bh=UjqECoU50me+Zf76kfj29GdCILskkcKoi1Cv+9xVQXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZW1//GBcGXjeOMAu+z+KEuvc7j9N+7RmZ1pDiwWe2sAj6P1t+GaTK6kut6O42ERXyo0lP0Pg8py4aRV2g/EtR6K0x/tXRJi4tMywlLIc103I/4eOHGRzaRbfiCYUjK/cc6z0gYo4EqmfKp2fdG+4krNndEPxkmtWAzlbqPNhEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9JBNXIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2CCC4CEF7;
	Fri,  6 Mar 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772810722;
	bh=UjqECoU50me+Zf76kfj29GdCILskkcKoi1Cv+9xVQXg=;
	h=From:To:Cc:Subject:Date:From;
	b=X9JBNXIQHGvJ8xShdOVNushozmOEIJAn781w/dr0D+zZiZ6uwKgXsTjnBW/YpWe0Y
	 sVlDSTSTs188x/Erl3gaJ0DJin5eYFOOmd3qiqvMyV2e0OdxS8UF/F1pV3649jIDoZ
	 EvrWhMhWr2P64V8OIRSXH1DHBmfRMpYse1wMXVVnPYHXXYpv6fdxAKi89nDPCnCDDx
	 yqVtgCV0q52Z+6ssR6Xm0PaVS63kU0DU2EOI8LtiZ2ohvzMTmWEmKrrXObKBYk3rPp
	 wj+5KQrvkg/f13KDohCTm/XCzhXUgrvscTMO7h+ZOpkstr+3rBj0yW4NvnWiOlZBbU
	 X5PWLpVZ7Jcaw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyX3I-000000074uy-2FhE;
	Fri, 06 Mar 2026 16:25:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/2] Better handle xform class
Date: Fri,  6 Mar 2026 16:25:13 +0100
Message-ID: <cover.1772810574.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 54C79223C31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78192-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jon,

Those two patches are meant to help re-using kernel-doc outside
Linux Kernel. Currently, QEMU uses it, but it requires a different
transforms table. The first patch adds support to overriding it
there; The second one documents its ABI.

-

I'm picking those two patches from the past series. Those were
merged together with man fixes, but they're unrelated.

So, let's place them in separate.

Mauro Carvalho Chehab (2):
  docs: kdoc_files: allows the caller to use a different xforms class
  docs: kdoc_files: document KernelFiles() ABI

 tools/lib/python/kdoc/kdoc_files.py | 53 +++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
2.52.0


