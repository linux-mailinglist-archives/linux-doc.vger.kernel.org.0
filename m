Return-Path: <linux-doc+bounces-94568-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0LJ1OSBERmq8NAsAu9opvQ
	(envelope-from <linux-doc+bounces-94568-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:57:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80B6F64B9
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:57:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ssIpdJ+K;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94568-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94568-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0005730C4B07
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CC330E85B;
	Thu,  2 Jul 2026 10:44:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA85346AFD
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 10:44:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989061; cv=none; b=IEnNJ3KcNsjyONBQqWS3OKzcMjcTo+/teWUK5bx0GrQeORN0Q1R2oNIcMUkCQXjlKq5OZGNoyQOEUhR2W5hDWBUsiWqcuU1fRsUEaL83YTOuQPXAZTKbWnxoSNPKIMhQQowFbR/v3l5rI0oPZ/qlZOJw1sV6yy4iZGTOatvdx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989061; c=relaxed/simple;
	bh=46tX/zdAb/ntc2LYLqL5SqouHOwjB4EOQVS+/ELIcx4=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=T/A5SexQ8pDt+u6+oXE3oXLHfdVLyhwn+H8I8f90nfLlube7vlMCt1hrnQs93Aj729rE+Gu9Cb85NvrGikNdqmyFN1XVsCllZI9xT8oa6mpJsdmjpibsbOKbQn2B31ek+yFwZhI4u4v8a3R5orbRkeRn4Tq84kaT0Lvt1VF8Xhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssIpdJ+K; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9c9916f75so9596655ad.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782989059; x=1783593859; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgGc8VtAqz3RMTpunweTaO9VhNBFOfPJAV5zmJ8+9hU=;
        b=ssIpdJ+KwMMm3BvZN+rpnkb7oo1TCnS0dHY+S5Mo277E9t1Co9lTU4Ruy2PpSu11MV
         eMJP1c9fz0KW19orR4Dg63U8QkNNkHHUsAG2WAjKhK424tGYFtt/0+QdxUKDYVrjmvgz
         40BY5HNYm9lFJnX8pzO8bRE9Smh1eTk3AU56ul75BJ0JZPsST/2il8h2qsPuYdE/WADf
         4OMuXf2WKOcy8YY8hJnmXAA+5klrMb6K2Yj/cXcM9mlsfJo6rHFjs4l3DyUGuXoEhRNs
         +KobV4gyQ+/Fw6g/INacRUj275qktPs9pVbv+WelbEJoTlub06gWHW7QynquXSrkNVbW
         eYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989059; x=1783593859;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgGc8VtAqz3RMTpunweTaO9VhNBFOfPJAV5zmJ8+9hU=;
        b=cMcm2WGmqgptI6C/V/VF/xBovO4sb/GpwPR/gaZA9wdrwSyij4weWIu3I3542ocCLc
         Z7zxGED95HtmWXCXmAK3KioVST2zfWx+fCSqIvpE5SNcKrmqCEYcx09V59muyi3rYtB8
         GCAqDAwf+w+BCYHgTOJaV9uqyOCm8AyhpuUCllP72cqFIM9tvop9TUSgKOi1I6MiwMoy
         J/etk6wdQ69mKh6BvQO+CBkEnQbEWGMwBFBhGpUbyFhMUCkdsf3tM1mV6Dr9wg8c07g6
         0tafmDomVXpP+PB3Cw7vsYA9rNU9avl6x2yZY1NmKX/ODxiAuJKo/I+zpp6BzMu86929
         LDxg==
X-Gm-Message-State: AOJu0YyQxOaRJ7AkQrkpBbzK8ova3MAaIVTaSKtONVcDfE2nhq8CQM0R
	bWnyqwgH9Hd2ww6Wot+xEONXUwiMvu3RgoBiW56x5TNOAPjmV5zd7ctM
X-Gm-Gg: AfdE7ckYVjOu/l7urRYFKSmSvkRNvFiOz5w/1/4n9QUhP3Vp+0c/BKROkkLSs0N/b1o
	/AHywKyet90E1oL7UXmwNyYgL9d7bU9LP0ldQUR060qvspWlCqvbFzDKr7RzsPolbUdMJExO0xs
	piV/G2SqCTNSAFTiERDgpDXPgGplUBI4GXxyeM12V1bCVU5UIZYim1stJYcnaU8GsputPaVc1Ie
	dEuawR9Ih8pTYIgegBq70ZtMzW4HH3sV8dq5Rk1wKWwzfgXzDadNEbWtFYEp+rduvdv9Gk9SBUP
	4IJQWBVuOsaA5gpEQX53SF7UfGAazmdzJSUCS2ZbxLAd7RQasErB2cSfLcuJv0s6Kdd7IXv0sPK
	0bkXkNdNloPjuZVQnuHSXRsgOcW6JOrutyaJ5b/Ox8PaEKQZ+SCyQ9Ys+1oUlhjwS9LW9wU10we
	E2+VyYrZWbTdM6N0btiqNQAlQ8mvtCMDroLdvxlj8oFmO3kI/ecDpWh5AcSg==
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr66826725ad.35.1782989059351;
        Thu, 02 Jul 2026 03:44:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2caa9a52a55sm5485545ad.29.2026.07.02.03.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:44:18 -0700 (PDT)
Message-ID: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
Date: Thu, 2 Jul 2026 19:44:15 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
From: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akiyoshi Kurita <weibu@redadmin.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -next] docs: submitting-patches: Fix section structure around
 DCO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94568-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[akiyks@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:weibu@redadmin.org,m:akiyks@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redadmin.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akiyks@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B80B6F64B9

Commit 5903019b2a5e ("Documentation/SubmittingPatches: convert it to
ReST markup") made "DCO 1.1" a subsection under the section "Sign your
work - ...".  However, the DCO text is meant to be referenced in the
section.

Furthermore, in HTML and PDF docs, paragraphs following the DCO:

    then you just add a line saying:

        Signed-off-by: [...]

    [...]
    as it was propagated to the maintainers and ultimately to Linus, with
    the first SoB entry signalling primary authorship of a single author.

appear to belong to the DCO, rather than to "Sign your work - ..."
where it should.

In reST (and other documentation tools), once you start a subsection
under a section, there is no way to go back to the section.

Fix the section structure by making the DCO a literal block, with
indent changes made in commit 5903019b2a5e reverted.

While at it, fix the same issue at "Reviewer's statement of
oversight".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/process/submitting-patches.rst | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index cc6a1f73d7f2..7ae79452e1b4 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,12 +404,11 @@ patches that are being emailed around.
 The sign-off is a simple line at the end of the explanation for the
 patch, which certifies that you wrote it or otherwise have the right to
 pass it on as an open-source patch.  The rules are pretty simple: if you
-can certify the below:
+can certify the below::
 
-Developer's Certificate of Origin 1.1
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+        Developer's Certificate of Origin 1.1
 
-By making a contribution to this project, I certify that:
+        By making a contribution to this project, I certify that:
 
         (a) The contribution was created in whole or in part by me and I
             have the right to submit it under the open source license
@@ -554,12 +553,11 @@ some testing has been performed, provides a means to locate testers for
 future patches, and ensures credit for the testers.
 
 Reviewed-by:, instead, indicates that the patch has been reviewed and found
-acceptable according to the Reviewer's Statement:
+acceptable according to the Reviewer's Statement::
 
-Reviewer's statement of oversight
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+	Reviewer's statement of oversight
 
-By offering my Reviewed-by: tag, I state that:
+	By offering my Reviewed-by: tag, I state that:
 
 	 (a) I have carried out a technical review of this patch to
 	     evaluate its appropriateness and readiness for inclusion into

base-commit: 2933b82083e758fe6cfff570143541d4dba672c3
-- 
2.43.0


