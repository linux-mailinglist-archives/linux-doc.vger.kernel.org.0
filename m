Return-Path: <linux-doc+bounces-78494-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOREHEv7rmnZKgIAu9opvQ
	(envelope-from <linux-doc+bounces-78494-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:54:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E555023D24C
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A610D30532A7
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 16:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196522BE7C6;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTLy6Gr3"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1362741B6;
	Mon,  9 Mar 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074886; cv=none; b=qIfqpEXHzk7JvkBExdeIpQebF3krKvxYUepgQWrvhCv0h9fTYFFy91Crt0uqXuR+jNEfClEeNezHDBpTUMWZDRVNWDKxRi/Zo8FV0L6rNklnggFC9dU15pm6s6ujHzw4WDQZ2rwHldFhl12PyVAnBaahbRTgMnynkg24eiNjk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074886; c=relaxed/simple;
	bh=EbGxY36L5SHyoRpmiRM2A+SFv9oh9MdFsH7yh2scoVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nez5wv65bZxN+eT8eNT+xZ2wbhYaF+g+mqA+9bjBLR6+0+Nn2KAcwf8a0jrKFJETOa+Qu2kbuvRdqo80CINIoE3izRAq37Ho1Ruk9R5i+7xZA6A70sO0vjJBs7ScBCRj5OcrGvifdV/bhC5KrNTVWTHH0wQQ+5fY3BspuVvqbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTLy6Gr3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F823C4CEF7;
	Mon,  9 Mar 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074885;
	bh=EbGxY36L5SHyoRpmiRM2A+SFv9oh9MdFsH7yh2scoVY=;
	h=From:To:Cc:Subject:Date:From;
	b=BTLy6Gr3hjinG+58i9TwaTUjgRRZ6kRBWo0eQBo4Pkk/veow98jLPk4rCaOYOAzsn
	 yEW82eHHg0LYrxTE38fGS4DNyN4N1fQicBKlK2oZRpJ+wjJlxsof9jvgKjQRMH5FaT
	 b265N7R35smnNIbPE2drS+Bo0ajVxu5GsW9Am0WIhXbwvxuh3nKKOr0hn4AnbyLDFM
	 wg8loHdP2XjE/uvrrV5DEezEgSDSWjEalJE3ahCZawlmsXGcrlcgjB8oDLECOihUUj
	 pBoV46Wv5c555F16oEdqycXyLb9Z3WHaJE44468Iy5DpJ6RTt32qf17RC9/pvOJUpg
	 vufipluOrtODg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdlz-0000000BhWm-1tS8;
	Mon, 09 Mar 2026 17:48:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/8] Fix public/private kernel-doc issues
Date: Mon,  9 Mar 2026 17:47:51 +0100
Message-ID: <cover.1773074166.git.mchehab+huawei@kernel.org>
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
X-Rspamd-Queue-Id: E555023D24C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78494-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jon,

This patch set fixes public/private handling inside comments.

The current logic has currently an issue: it breaks nested
structs if private: is not followed by public:.

It also solves a currently undefined behavior: now,
public/private are applied only to the current and
inner statements. So, if one does:

  struct {
	struct {
		/* private: */
		int a;
		struct {
			int b;
		};
	};
	int c;
  };

The output will be:

  struct {
	int c;
  };

Besides making sensing itself, the new behavior solves
an issue when struct_group() macros are used, as the
private from one struct_group won't propagate to other
ones nor to the struct encapsulating one or more
struct_group().

This series start with 2 unittests to detect the problem.
If you apply those two patches and run the unit test,
you'll be able to see the issue.

After applying the changes, it renames the unit test,
making it test directly the code there, instead of the
current wrapper at kdoc_re, and add more tests meant
to check the tokenizer itself.

-

As commented previously, I'm now working on a patchset
using the tokenizer for NestedMatch. I have already
some code here, but not properly tested yet.

Anyway, the idea is to keep submitting it in small
chunks, to make it easier to review.

Mauro Carvalho Chehab (8):
  docs: python: add helpers to run unit tests
  unittests: add a testbench to check public/private kdoc comments
  docs: kdoc: don't add broken comments inside prototypes
  docs: kdoc: properly handle empty enum arguments
  docs: kdoc_re: add a C tokenizer
  docs: kdoc: use tokenizer to handle comments on structs
  unittests: test_private: modify it to use CTokenizer directly
  unittests: test_tokenizer: check if the tokenizer works

 Documentation/tools/python.rst       |   2 +
 Documentation/tools/unittest.rst     |  24 ++
 tools/lib/python/kdoc/kdoc_parser.py |  25 +-
 tools/lib/python/kdoc/kdoc_re.py     | 234 ++++++++++++++
 tools/lib/python/unittest_helper.py  | 353 ++++++++++++++++++++
 tools/unittests/test_tokenizer.py    | 462 +++++++++++++++++++++++++++
 6 files changed, 1088 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/tools/unittest.rst
 create mode 100755 tools/lib/python/unittest_helper.py
 create mode 100755 tools/unittests/test_tokenizer.py

-- 
2.52.0


