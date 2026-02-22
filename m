Return-Path: <linux-doc+bounces-76502-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gl/DYyJm2n21QMAu9opvQ
	(envelope-from <linux-doc+bounces-76502-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 23:56:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3DA170A63
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 23:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA4C300D958
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 22:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721D935BDBD;
	Sun, 22 Feb 2026 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gShPXYpS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64D1DED57
	for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771800969; cv=none; b=oBON3hlmf80y5UUJWuL4J8EJIUwDYg+RhlgYr1UMB/qO1gG8D2j8moW8gHwyM9SvYDc3z8UPmVnJdU8/od7yL7MU93C+AZIFxiLQkJlWL1lKcir3C/i7xU3vHm93XyfE9oqmnHeR6fA2BmSqSR4EE4HGYFuDZnkqC4pdRqWzMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771800969; c=relaxed/simple;
	bh=vH24ygl0lUP9kYNQreLnnxLpHLeGUIr0F19K0nZzQ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kV9RxIpp+Q1gxNN+KKpTn4Hle7VopurWIBbSN+MKC+PSNNl6Ct6trtbSgrdulDmt8B/BJjpBvPYSp7gED1cowIr6mCtUppylKpl3S3y8nE83M3il+wZJiZoCRNUedRQJZlrk7FkzpU8YQrtmadxWa1xCcGa9IrF3+i7SI7cieMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gShPXYpS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79827d28fc4so13863907b3.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 14:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771800967; x=1772405767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DstXTFOjjOc95Qmzr+SeIQriKKg0cVXhchBEqikS0w=;
        b=gShPXYpSHniqp7AECv2sgmnAMF8AcqjLOq/ZPQWVc8CH5LaREDykC3RlWyIN1UcHRX
         Vvkn7oK9DVihmCbUCTveOdUKJwZv3DrDl1tAwP6NKr0C/UuLgWuQ6QGWEZbgbA146Nev
         Pw9DrBF3Fr4VIjXhWSp92JJgcrxH4B2BPHm3BaRVDFDdgqOw17cglFNUWZkRLLEbuA47
         SFW0XKjJG0AagxURiMiyLjbZcFjELANpBqau1eMiEX74aogVt/Qj4LkLafMcXcM5d9ns
         +1AaYo2gaudLKDO3YI4vWy9rV9oQO0fInvznLRxwb07iySFb4nGWvMSzbGyinKt03C9I
         3/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771800967; x=1772405767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DstXTFOjjOc95Qmzr+SeIQriKKg0cVXhchBEqikS0w=;
        b=L2e8P0BryjjPsob1w0v5Vi/6tmO1elVlmjUjpIP2xfnx1Hic2SbGtQ1kWjUJuN9SLR
         l90l769c4jsj3LdWQtAu4sHiTAf3lDp5g0Xu86mzADHDCQ1/lIzzR8/t9ZRsxnryhL8n
         6xkZ79aUZj49DFgDwUPgoBDitNLfstqyI2jB6ptkBCycazWp0W9AVaKja3qf+daPQzRo
         6gEJskN2+oQTCxhZP2eUha0mVXG9sZxztz8CZpOUCrQ5osmV8rxN5f9cYMSNWhitqAXQ
         NBbxatfr2XlD0OVxhoqE6AxQ2wJIegvEi5I1he97OW2pUashKDN4TmPmofU6fZXKlQJE
         9Knw==
X-Forwarded-Encrypted: i=1; AJvYcCWkqZg5UDB1dWB1IkYGPogldgss/YHFg7x/RF5PqcWZ5ymBFIY0gumQuUChDdvzY00F8WLdQM8vkec=@vger.kernel.org
X-Gm-Message-State: AOJu0YymywiiXANxQA2FoPxNfCeG4Nlrxik1/8mrs4tS+kB67qE3Pehv
	YuryKwRSa41+Fz7XqNuvKYGUWngkjXLRvsHuCUTBJDu7+2Z9xK4Qx4uk
X-Gm-Gg: ATEYQzxD0JqJOPD2v5iZiffRX6GkA67ZUKo7l31LjamJFa97EeWXsA9FIlTN4CNvUNI
	Dxa9JO3/ptcFjqNHBg3Ko0zQ8RO1F3SWGQikWb10wcq7as5Hh11a65Qb4fyzwbVGcP3XS5OKl5o
	j9MZuw5/8Iwhb9uBOVgasuuS7pZKEK1l+POParkf2A33s21ceifpl95qTTA0GOUXFDJ35MQ5BOQ
	bWzMQfymk7mhyxCuF9ab/bQr4cex6GsGTym/2551Y2FUe4mcU5ndXimIhAEpXAt2wHuKEDIvK4Z
	Sbskcr4KBZ3eLJZ4vkseHAtRmD5EfS270ry0a2vZBqwo6+BQ9B9V6bLEGUljVFwPsyHNc5lqoS8
	qip3G9PC+QkXYOhgIcJlpFYe2Go3e4XKUbypsJ3SIk6efC8VN/qqtsTMm36T8acER1b0tpnbx5y
	OWAmvhuG7iR18VTBFjilk=
X-Received: by 2002:a05:690c:2701:b0:798:1adc:6804 with SMTP id 00721157ae682-79828ff1c5cmr56780367b3.43.1771800967149;
        Sun, 22 Feb 2026 14:56:07 -0800 (PST)
Received: from Gentoo ([158.173.25.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982de1a659sm24518477b3.52.2026.02.22.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 14:56:06 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Julia.Lawall@inria.fr,
	nicolas.palix@imag.fr,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] Doc: dev-tools:  Added Gentoo in the Operating system list under Getting Coccinelle
Date: Mon, 23 Feb 2026 04:19:56 +0530
Message-ID: <20260222225536.19196-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-76502-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unixbhaskar@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E3DA170A63
X-Rspamd-Action: no action

 Adding Gentoo in the operating system list under "Getting Coccinelle".

 This is the correct way:

 Example:

 bhaskar_04:20:50_Mon Feb 23: :~>sudo emerge -av dev-util/coccinelle
 Password:

 These are the packages that would be merged, in order:

 Calculating dependencies... done!
 Dependency resolution took 7.99 s (backtrack: 0/100).

 [ebuild  N     ] dev-lang/ocaml-4.14.2:0/4.14.2::gentoo  USE="-emacs -flambda
 -latex ocamlopt -xemacs" 5377 KiB
 [ebuild  N     ] dev-ml/dune-3.20.2:0/3.20.2::gentoo  USE="-emacs" 2981 KiB
 [ebuild  N     ] dev-ml/findlib-1.9.6-r1::gentoo  USE="-doc ocamlopt -tk" 265
 KiB
 [ebuild  N     ] dev-ml/result-1.5:0/1.5::gentoo  USE="ocamlopt" 3 KiB
 [ebuild  N     ] dev-ml/sexplib0-0.16.0:0/0.16.0::gentoo  USE="ocamlopt" 22
 KiB
 [ebuild  N     ] dev-ml/ocamlbuild-0.15.0:0/0.15.0::gentoo  USE="ocamlopt"
 198 KiB
 [ebuild  N     ] dev-ml/menhir-20240715:0/20240715::gentoo  USE="ocamlopt"
 1217 KiB
 [ebuild  N     ] dev-ml/num-1.5::gentoo  USE="ocamlopt" 67 KiB
 [ebuild  N     ] dev-ml/camlp4-4.14_p1-r2:0/4.14_p1::gentoo  USE="ocamlopt"
 627 KiB
 [ebuild  N     ] dev-ml/csexp-1.5.2-r1:0/1.5.2::gentoo  USE="ocamlopt -test"
 12 KiB
 [ebuild  N     ] dev-ml/uchar-0.0.2-r1:0/0.0.2::gentoo  USE="ocamlopt" 22 KiB
 [ebuild  N     ] dev-ml/dune-configurator-3.20.2:0/3.20.2::gentoo
 USE="ocamlopt" 0 KiB
 [ebuild  N    ~] dev-ml/stdcompat-21.1-r1:0/21.1::gentoo  611 KiB
 [ebuild  N     ] dev-ml/base-0.16.3-r1:0/0.16::gentoo  USE="ocamlopt" 433 KiB
 [ebuild  N     ] dev-ml/parmap-1.2.5:0/1.2.5::gentoo  USE="ocamlopt" 48 KiB
 [ebuild  N     ] dev-ml/stdio-0.16.0:0/0.16::gentoo  USE="ocamlopt" 8 KiB
 [ebuild  N     ] dev-ml/parsexp-0.16.0:0/0.16::gentoo  USE="ocamlopt" 56 KiB
 [ebuild  N     ] dev-ml/sexplib-0.16.0-r1:0/0.16::gentoo  USE="ocamlopt" 54
 KiB
 [ebuild  N     ] dev-ml/pcre-ocaml-7.5.0:0/7.5.0::gentoo  USE="-examples
 ocamlopt" 41 KiB
 [ebuild  N    ~] dev-util/coccinelle-1.3.0::gentoo  USE="-doc -emacs ocamlopt
 pcre -python -test" PYTHON_SINGLE_TTotal: 20 packages (20 new), Size of
 downloads: 14168 KiB

 Would you like to merge these packages? [Yes/No]


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1: Package name mismatched, corrected
 Documentation/dev-tools/coccinelle.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6e70a1e9a3c0..990a049091e1 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -29,6 +29,7 @@ of many distributions, e.g. :
  - Ubuntu
  - OpenSUSE
  - Arch Linux
+ - Gentoo
  - NetBSD
  - FreeBSD

--
2.52.0


