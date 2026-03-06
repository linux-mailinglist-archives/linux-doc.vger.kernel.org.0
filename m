Return-Path: <linux-doc+bounces-78197-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNTTHgP3qmlxZAEAu9opvQ
	(envelope-from <linux-doc+bounces-78197-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:47:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D407E224269
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37BBA3069D3C
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CB3D3329;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP7ERQFx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7053115AF;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811958; cv=none; b=gpBOF6J73e8INztwmfDyhXSSpVEEij6qNN8ZiSVaJ47s1Ilj/gxlzeeQtYGC4wYu4xx4Bhy0q/gfYPhzTWOHFTsGLcg8SgO9iB9l8n/TXXqlEkFPTQ5xdbALukWloa1BH/Ec5CdFuWGcaTsxpBk2DB1Yg+V1FhWgmKw9oWZxkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811958; c=relaxed/simple;
	bh=LxuxzcmDjyhXrl3UcoO8P7kmp1ga0m122qdkgjuipGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YWhQ6q+Xv3rYTUQnYx9PLsjX5dF4I543Z+ORXp9AgatMEgFmvLjwd780HfyJPinyj87mMCcM23txsPxVQehSajDPiQtCtgtrGlEVaHrwpMU35nSFwLXfXmaRVbOMwsFjGH1x56mzWPx9naJJLP5GUfNUSt8+Zo4by2FnmFxN0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP7ERQFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE721C4CEF7;
	Fri,  6 Mar 2026 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811957;
	bh=LxuxzcmDjyhXrl3UcoO8P7kmp1ga0m122qdkgjuipGo=;
	h=From:To:Cc:Subject:Date:From;
	b=JP7ERQFxMDa6eYh+x+9BJR7I+xKRML2IRE5PRlv3a/eKUr7CJ6yCzKuU+YBTYD42Z
	 +lfqKXnf7rYXjmYQAgAa/lSBKlRVkcUeNYlKuabAC8J88vkctzf3w136wPra8B2riC
	 pXfkcxhmLLj0ER90HDtExe2cRLC50ea4J0ZiLzbfQlTPnSTJIf4KJkP4PxcsutpF7t
	 aARgo77ivXF94xBkmz2cWOkFZzEw6R5WbsXEC0O3mm+xAfU4xtru5czF2tcXxXYwwL
	 b5qFdo3CwFfsHRsTedyO9oka9Apkre0XrrpPnQhBUwTuB7gDp98OKxFDot6ZgNGS/c
	 irhvMrZ5SBG2w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXND-00000007EUo-4BBM;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 00/13] kernel-doc improvements
Date: Fri,  6 Mar 2026 16:45:38 +0100
Message-ID: <cover.1772810752.git.mchehab+huawei@kernel.org>
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
X-Rspamd-Queue-Id: D407E224269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78197-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jon,

This patch kernel-doc improvements. On v2, I'm keeping just
the patches related to man pages generation.

The first patches on this series are focused mostly on .TH
(troff header) line, but, as a side effect, it also change
the name of man pages generated from DOC kernel-doc annotations.
At the previous state, those were overriden due to lots of
duplicated names.

The rationale for most of such changes is that modern troff/man
page specs say that .TH has up to 5 arguments,, as defined at [1]:

       .TH topic section [footer-middle] [footer-inside] [header-middle]

[1] https://man7.org/linux/man-pages/man7/groff_man_style.7.html

Right now, Kernel uses 6 arguments, probably due to some legacy
man page definitions.

After double checking, modern man pages use this format:

	.TH "{name}" {section} "{date}" "{modulename}" "{manual}"

Right now, man pages generation are messing up on how it encodes
each position at .TH, depending on the type of object it emits.

After this series, the definition is more consistent and file
output is better named.

It also fixes two issues at sphinx-build-wrapper related to how
it generate files names from the .TH header.

The last 4 patches on this series are new: they fix lots of issues
related to groff format: there, new lines continue the test from
previous pagragraph. This cause issues mainly on:

- tables;
- code blocks;
- lists

With the changes, the output now looks a lot better.

Please notice that the code there is not meant to fully implement
rst -> troff/groff conversion. Instead, it is meant to make the
output reasonable.

A more complete approach would be to use docutils or Sphinx
libraries, but that would likely require to also write a troff
output plugin, as the "man" builder is very limited. Also,
this could be problematic, as kernel-doc classes can be called
from Sphinx. I don't think we need that much complexity, as what
we mainly need is to avoid bad line grouping when generating
man pages.

This series should not affect HTML documentation. It only affect
man page generation and ManFormat output class.

Mauro Carvalho Chehab (13):
  docs: sphinx-build-wrapper: better handle troff .TH markups
  docs: sphinx-build-wrapper: don't allow "/" on file names
  docs: kdoc_output: use a method to emit the .TH header
  docs: kdoc_output: remove extra attribute on man .TH headers
  docs: kdoc_output: use a single manual for everything
  docs: kdoc_output: don't use a different modulename for functions
  docs: kdoc_output: fix naming for DOC markups
  docs: kdoc_output: describe the class init parameters
  docs: kdoc_output: pick a better default for modulename
  docs: kdoc_output: Change the logic to handle man highlight
  docs: kdoc_output: add a logic to handle tables inside kernel-doc
    markups
  docs: kdoc_output: add support to handle code blocks
  docs: kdoc_output: better handle lists

 tools/docs/kernel-doc                |   1 -
 tools/docs/sphinx-build-wrapper      |  10 +-
 tools/lib/python/kdoc/kdoc_output.py | 297 +++++++++++++++++++++++++--
 3 files changed, 283 insertions(+), 25 deletions(-)

-- 
2.52.0


