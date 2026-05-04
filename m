Return-Path: <linux-doc+bounces-85675-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNooGozA+Gnh0AIAu9opvQ
	(envelope-from <linux-doc+bounces-85675-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:51:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 097284C0E78
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08C0430193AA
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DBC3E1201;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMNn0qDh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1C3DFC68;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909888; cv=none; b=oKBWftuf6vmvjzAVA7kAZAoqpyIhSpJyjVsxWRo6OHpa6vu0djSd7sROpybo9Nbl2PDXB6wDXjLfiVwjq/gCryeB19ErmojmtBXKrtJ1/VQPOouojxyMyM/L+1ZCwPE0fXuFGocurXchQsgX2RXKiFBoAKrZsc356L4rDbUjdzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909888; c=relaxed/simple;
	bh=OziWK8aR/qkKZPas1bWViRZGxXO2Vk6TjcG6CgLnVIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vDIi0yh0TqcUGbhHogF2SN47FgjZZixb5PBClA4qCWEfZquOVIo5yWkkD6hcgpDxvo88ZccLEFnUkKU36XTGQ2WyZJQBqwWW252Y+y5jIzDNPABk9TJKE693hcYJlcTvaBkD2e1bTmCgh1xlMlnvlLXnB14TrMBGoQUO7IIE0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMNn0qDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7413DC2BCF5;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909888;
	bh=OziWK8aR/qkKZPas1bWViRZGxXO2Vk6TjcG6CgLnVIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jMNn0qDhbTtNj78mwBby2hTKZtXGCzY09CaHaaWJnG/gqjdSwUwZ20o+er7dXVwhX
	 swcww/ryMg1QMGomOe2KRZK0u3fibx3A4m0PiCejl9gbbrdLsaQCPgAWWBzbAEjN8d
	 iyMSIJpX6jL9PPmAPtY9EEsEMR7ZJnrqwl3r0wtoO9qXqo2UGif2yYqYp5ADTgJbp5
	 SVQj2bVrsSox8B1TFS/Q2tbVzRDSI9nLxkdXY5kkl1Iqiu6JEE98x1KR3LLzBUaqno
	 aC9FSe2NUbSWRy1dLeZArzK3IJNrCkwuSpLtKxU10cmMwLDbJCEPmzNf/NY6txX462
	 cX8jAuwA69pbQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZu-0000000Ey4N-1heV;
	Mon, 04 May 2026 17:51:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Joe Perches <joe@perches.com>,
	Matteo Croce <technoboy85@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/9] Improve process/maintainers output
Date: Mon,  4 May 2026 17:51:09 +0200
Message-ID: <cover.1777908711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 097284C0E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com,google.com,linux-foundation.org,garyguo.net,perches.com,gmail.com,linuxfoundation.org,umich.edu];
	TAGGED_FROM(0.00)[bounces-85675-lists,linux-doc=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Jon,

As promised, this series improve the output at process/maintainers:
instead of a pure enriched text, the maintainer's file content is
now converted with a table, and has gained a javascript to allow
filtering entries.

The initial patches change the logic to split parsing from
output generation. Now, everything is stored into a dict at
the parsing phase. This way, it is easier to adjust the
directive handler for it to produce a more structured document.

Right now, the entries are sorted alphabetically, per subsystem's
name.

---

As mentioned before, I did some extra tests here, changing the sort
logic:

- per mailing lists. Easy to do but require a couple of hints;
- per number of files (after using iglob) to calculate the
  actual number of patches. This is fast with NVME, but could
  be slow with HDD.

Doing that helps to group the output per subsytem (assuming
that each major subsystem has its own mailing list), and
placing the subsystem before each entry. Yet, after adding
the JS filter, I'm not sure if it is worth doing it(*).

So, I kept such changes out of the final version.

In any case, with the new logic, changing the output is easy.

(*) Hint: Try setting the <Filter:> box there to linux-doc :-D

    This one is sorted on a nice way, but if you set it to
    linux-media, you'll see that the first entry is Orphan.
    The most relevant one is hidden in the crowd.

-

It should also be easy to add some logic there at the Sphinx
directive to allow, for instance, include per-subsystem
entries, e.g. one could add, in the future, support for
things like:

	.. maintainers-include::
		mailing-list: linux-doc@vger.kernel.org
		sort-by: file-count

And have a page inside the subsystem (Documentation on this
example) with all maintainers per subsystem.

This is just a rough idea. I'm currently not planning to
implement it.


Matteo Croce (1):
  docs: escape ** glob pattern in MAINTAINERS descriptions

Mauro Carvalho Chehab (8):
  docs: maintainers_include: keep hidden TOC sorted
  docs: maintainers_include.py: split state machine on multiple funcs
  docs: maintainers_include: cleanup the code
  docs: maintainers_include.py: clean most SPHINXDIRS=process warnings
  docs: maintainers_include: do some coding style cleanups
  docs: maintainers_include: store maintainers entries on a dict
  docs: maintainers_include: don't ignore invalid profile entries
  docs: maintainers: add a filtering javascript

 Documentation/sphinx/maintainers_include.py | 405 ++++++++++++--------
 1 file changed, 249 insertions(+), 156 deletions(-)

-- 
2.54.0


