Return-Path: <linux-doc+bounces-92343-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4JYPOYQ+L2p+9gQAu9opvQ
	(envelope-from <linux-doc+bounces-92343-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 01:51:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E80CF6828B8
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 01:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=liFGYXiQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92343-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92343-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36275300119D
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 23:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE0237F735;
	Sun, 14 Jun 2026 23:51:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271737FF54
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:51:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481065; cv=none; b=CCYQkKH75GCk8cdZer2nYP0rkLNuqMA4iPVdXcd8ItU7y0a9QjuCjUVfI9BkyQlufqBrVXNUizSVw3LKufjZq9JRZRntw5Kt+meJCF/Z1oUScn3ZwzbSWb4DM+9VLOqgV+1z25cc8bGTDN6YHY7jP2rmXp/GptGHuBBxxFsRKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481065; c=relaxed/simple;
	bh=i38F7jpguMjczztO95+CzmqhADyNIhJu+zd7DEXFano=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBkURdTMKuV+nTmUIFxMvpFPpx8ZMLoyI5rHXzQwRYTZkGUVWgw+MrhlgSc/VR2OcCwMV8Hws+p6sK7ln5GPrMrdE7oky0c2n8Fyw7KkEL3YV9tAFntr+AJpmvAJXyetyV8S5XquZuqnae6kqvg4Tx4JXQcwCbhsGYXNE1SfZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liFGYXiQ; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso1006816e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781481063; x=1782085863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNd1mTmS3WOPR3+vXPubCLGAjkjoWTV/vXWyrQNlXKg=;
        b=liFGYXiQkLlHf0bHE2YXqnmd3bdtYI+mn6YTh28Tk2snKYwYL7a8Cu2GZqQ2PrSq9A
         sunK8f8VHDeBLbsM+LxzhHXAG90VxdKc+F2+Jfn3wMAWwz0h1gRc7sjassUn4fVUMmvn
         6onrUrL4BALnW8id+IKMrzE+0keL0VkVjsHtWr58gzkcgYy+RVkyPC+IJ+RmBFFCspoZ
         9BA30iypM20+UX4ycLduZNUEmvYLog4bTIIQxtlqXTKJel43Zw4NKTybi398r/rA9ntV
         zTzsxYSfqNHM5qB7d3h0iM7F0R9eJd8dhknnFRWYiGw/eXLV03Fse5BbUEeMboFeHsSa
         QamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481063; x=1782085863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNd1mTmS3WOPR3+vXPubCLGAjkjoWTV/vXWyrQNlXKg=;
        b=JrP5L41AY7jPzxGQ1jnQ8LorsHOFxzW8LasB5qDYRN58oIA3YpF0cHDrdeSORClOjc
         9Oml9GlFBTI0DBEl510SLLC1KT/gMgl+SB5v5eEgM0nk/bb0GXmj5qF7AhzD54IZZbV2
         6q92SfRY7XvsNYaO9RTkF6JuOFjjJcxaajgOpzuPLyKh+9bNMsNk6ber5lz7bymhvJQD
         tqYICSau1Uq/IZugcZv+pOc4y3i8CJvCqTBFSjVWgRrYJGTWMmpsrYfpRA4rGkVCObEi
         ePJ4pMzZZiAAXVMK9UyUdI1962Eq+BeLbO3/qDcAU8OI1DAYMp6otLhbTqidWVarFbuN
         O88Q==
X-Gm-Message-State: AOJu0YzKhX6x9UONpcpAOaRb+GKqlwz9k1IwdnGNcJWzaOhdtwxBN/mJ
	p27ifrlf7TAdb3o0VgRsRCckdIOdMjW7GXgRaIABlJCnjQpVqSpGSXQs
X-Gm-Gg: Acq92OGUayXrfoN+OwxEBNcb7KKI8mA2yfy6QXMKdXYy365YHZz1lxWxprTf1oRztBz
	B8PyQDbb3wt8aWp3zqGQhRIj6r1QaQXurIeof8d5b6bSV/um/eEK+uVrpBI6UHE+MOu2cOvAunt
	qp2nnTvcUO8aSNuGmK1EXJOIQX+JSD8og746Af0NRJfg6J/iE1Zwuz0znpNz0zj4ylxRvak9vuG
	cZ6LMz3HzjAMp/xzz9A4O+brBd/umAnmwg/cuR0zghIW5/Fz2f9Wi/drlL6VZukDhcFoiv90yUp
	g/MFuv3oktArB5XjAY6sa6PLLAKbYO7nIm1JQxyihCKRPutXVfYBv/ATD7011OAPqilbtK9e1I0
	bd+BoviRDM6tEVGE8i9fjXq2q32kdEOWYR7Wf0saLMb9DYAUHugojo3dQdC6RMtcV14ZgGwuffw
	QCPdrbTsbG12s8LKtICk/qQNyxYU1CQyWbs/GRtXjyVx/oA/Pa41vb4wEe78/EBy35Z+DsvQxMJ
	Hzz7eG4zg==
X-Received: by 2002:a05:6102:f88:b0:62e:c54:fccb with SMTP id ada2fe7eead31-71e88e043b5mr6127481137.28.1781481063563;
        Sun, 14 Jun 2026 16:51:03 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208788587esm1630195137.10.2026.06.14.16.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 16:51:03 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
Date: Sun, 14 Jun 2026 20:50:39 -0300
Message-ID: <20260614235044.42810-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92343-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:danielmaraboo@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E80CF6828B8

This patch series translates chapters 4 and 5 of the kernel development
process documentation ("4.Coding.rst" and "5.Posting.rst") into 
Brazilian Portuguese (pt_BR).

The goal is to expand the available documentation for Portuguese-speaking
developers, making it easier to understand core coding standards and
patch submission guidelines.

Daniel Pereira (2):
  docs: pt_BR: Translate 4.coding.rst into Portuguese
  docs: pt_BR: Translate patch posting documentation

 .../translations/pt_BR/process/4.Coding.rst   | 440 ++++++++++++++++++
 .../translations/pt_BR/process/5.Posting.rst  | 376 +++++++++++++++
 .../pt_BR/process/development-process.rst     |   2 +
 3 files changed, 818 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst
 create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst

-- 
2.47.3


