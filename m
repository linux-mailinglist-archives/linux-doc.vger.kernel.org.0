Return-Path: <linux-doc+bounces-42435-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E104AA7EE76
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 22:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE52B166559
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 19:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB74325522E;
	Mon,  7 Apr 2025 19:53:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9640221704
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055602; cv=none; b=i1iaRrwuXib0dsHaveSBJhtMez8/ZomOvta4yal4sB+hPBDN9tHoZvw9mpOZv4Sre+hOAUat3c041LJxYA89NQJwpRrtJ3S5TdAoSg+FYtR5Cdej+CYenCemRNw/vKzEG1Ykw1bSW8MqGbigE+VIhdzJ2jxo70Ee7gWRqhoVQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055602; c=relaxed/simple;
	bh=pkSREPfjX89CJRyTeNKJr3DzQAcLsi4uGXz6M+ToH7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpR2WQsb+7SRx/J/O90h1NP6av89E+f9JKHbvJOsWnu6a8JkJ/at+x5Ym+4mBGKaG+BFCeeIAJAvHvZjwZqunkdmyk3L2hjNq3U7q5ESHPHxZqFfQ82AkKdHdS0A84YcpGeNmscaKlpprL4AgEzMwRyDkKuc3TQDWd+FgOlqCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=195.121.94.186
X-KPN-MessageId: cb898a7f-13e9-11f0-a9b5-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id cb898a7f-13e9-11f0-a9b5-00505699b430;
	Mon, 07 Apr 2025 21:52:11 +0200 (CEST)
X-KPN-MID: 33|BGW52vnc5UT+0p7od8z203/CIjv+lk/VDrC1lL0L2g7AZ65s5haxx1UJq4orBsd
 jChSpbfzZvbSUaPPZk987+g==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|QVZT8R8kZlY/ZuRs3CUb3m2S9c02m8gznOzGOYP+c2wf8LUhu895RfvZ8qPmmvH
 SCumIuCBooI5DYi69nA7Row==
Received: from localhost.localdomain (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id cb80a3b1-13e9-11f0-97d0-00505699d6e5;
	Mon, 07 Apr 2025 21:52:11 +0200 (CEST)
From: Jelle@web.codeaurora.org, van@web.codeaurora.org,
	der@web.codeaurora.org, Waa@web.codeaurora.org
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Jelle van der Waa <jvanderwaa@redhat.com>
Subject: [PATCH v3 0/1] reproducible sphinx docs
Date: Mon,  7 Apr 2025 21:51:19 +0200
Message-ID: <20250407195120.331103-1-jvanderwaa@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jelle van der Waa <jvanderwaa@redhat.com>

James Addison brought up this patch regarding reproducible kernel
documentation and I volunteered to re-send it as they have issues
setting up a MTA.

With this patch Arch Linux is able to succesfully when reproduce the
sphinx docs on a different machine.

James Addison (1):
  docs: Disambiguate a pair of rST labels

 Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
 .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.49.0


