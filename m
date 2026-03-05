Return-Path: <linux-doc+bounces-78013-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MACXM2GeqWnGAwEAu9opvQ
	(envelope-from <linux-doc+bounces-78013-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 16:16:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 536852144DC
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 16:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1945B30F1E85
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 15:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00713C1994;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQGxLAfX"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0293BFE54;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723787; cv=none; b=FiqkI+d75r+GqbMz5gAQYIcN3FeX5muZQ9w3HTeM0djFXtJPcJqSmbOl0M/pqz6DKAE+3AGgmujMvJZAq4EId9KTqC7Ztm8Hn9Ehp0N79y1b0KdncuNUHqmXkdZllS3xYbNB9ICscR7dhxFEOaq9tcPRy6uAQEZTuYpSN23MFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723787; c=relaxed/simple;
	bh=7XrzRQZSWI4TFDuEEM1AGdycXBGZf9IZAxSBO7iPUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ulUamLzIoeyIlRWIrrAvjFnbNs6Yv3z4o4/74ycrd+gbWkIuu1tzfwpjOkJkfcYSvMjlL2pdHGC0Ovd5HS9TSexLbuCoaJClGnBvDTgBKymSS4owVnQUIxkWVkAVKHzBe2LzG0JOZSXAmLbjUrFR+DYWSObcJv5S/W/p+VDgCqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQGxLAfX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199C2C2BCB2;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723787;
	bh=7XrzRQZSWI4TFDuEEM1AGdycXBGZf9IZAxSBO7iPUqE=;
	h=From:To:Cc:Subject:Date:From;
	b=kQGxLAfXhj5qnEcMUMB8/DrHIPl/mb8ODvqPbaCZ1Sua+oBc0qjvwpsg+fCim+WKV
	 8m6ky8brD+o5T3xcgmY4MNli60o1oBw6ltRIrOB8BW0vi+dHJ3PKxNXLZwQ4RziHp+
	 MuJc0I0qJwH5TQEGu5PW66WGiGpqkxMMT3+WLyzKV80yXW9p2dr4COPY5NL3OY1V/+
	 BOss0b/uXXOiM60r9trkS3U5imDEui0+ASujHtw+EgDECQxxcImYCtEz1aKkzFGcjX
	 sjrwlh3FX9UBH0QFZjl66QxJOxRvBUEpiJAQwRDn/E9/MNwaTxlzff1jZ0NMgr5ZzF
	 J4lvSt1yc6dFw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR6-0000000HK1a-4BAl;
	Thu, 05 Mar 2026 16:16:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 00/11] kernel-doc improvements
Date: Thu,  5 Mar 2026 16:16:07 +0100
Message-ID: <cover.1772722474.git.mchehab+huawei@kernel.org>
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
X-Rspamd-Queue-Id: 536852144DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78013-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jon,

This series contains some patches that were submitted originally
on this /41 patch series:

	https://patchew.org/linux/cover.1769867953.git.mchehab+huawei@kernel.org/fc6723d13b96db014eaf0f14354d8821ea2085b8.1769867954.git.mchehab+huawei@kernel.org/

It consists on two parts:

- the first two patches are meant to better allow using kernel-doc
  inside QEMU and to improve KernelFiles ABI, which will be used
  there. I'm placing it here just to avoid on extra PR with just
  two patches on it.

- the second part do some improvements on how man pages are produced.

The second part is related to man pages. It is focused mostly on
TH, but, as a side effect, it also change the name of man pages
generated from DOC kernel-doc annotations.

The rationale is that modern troff/man page specs say that .TH has
up to 5 arguments,, as defined at [1]:

       .TH topic section [footer-middle] [footer-inside] [header-middle]

[1] https://man7.org/linux/man-pages/man7/groff_man_style.7.html

Right now, Kernel uses 6 arguments, probably due to some legacy
man page definitions.

After double checking, this is typically used like this:

	.TH "{name}" {section} "{date}" "{modulename}" "{manual}"

Right now, man pages generation are messing up on how it encodes
each position at .TH, depending on the type of object it emits.

After this series, the definition is more consistent and file
output is better named.

It also fixes two issues at sphinx-build-wrapper related to how
it generate files names from the .TH header.

This series hould not affect HTML documentation. It only changes
man pages.

As the names are now better defined, it also prevents some
file name duplication.

Mauro Carvalho Chehab (11):
  docs: kdoc_files: allows the caller to use a different xforms class
  docs: kdoc_files: document KernelFiles() ABI
  docs: sphinx-build-wrapper: better handle troff .TH markups
  docs: sphinx-build-wrapper: don't allow "/" on file names
  docs: kdoc_output: use a method to emit the .TH header
  docs: kdoc_output: remove extra attribute on man .TH headers
  docs: kdoc_output: use a single manual for everything
  docs: kdoc_output: don't use a different modulename for functions
  docs: kdoc_output: use a more standard order for .TH on man pages
  docs: kdoc_output: describe the class init parameters
  docs: kdoc_output: pick a better default for modulename

 tools/docs/kernel-doc                |  1 -
 tools/docs/sphinx-build-wrapper      |  9 ++--
 tools/lib/python/kdoc/kdoc_files.py  | 53 ++++++++++++++++++--
 tools/lib/python/kdoc/kdoc_output.py | 73 +++++++++++++++++++++++-----
 4 files changed, 115 insertions(+), 21 deletions(-)

-- 
2.52.0


