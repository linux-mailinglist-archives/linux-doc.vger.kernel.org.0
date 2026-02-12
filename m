Return-Path: <linux-doc+bounces-75911-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPvfJoLMjWn87AAAu9opvQ
	(envelope-from <linux-doc+bounces-75911-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 13:50:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F312D893
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 13:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2F2E30186AB
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 12:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A8C1957E8;
	Thu, 12 Feb 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CutIXkU9"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60235BDA0
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900592; cv=none; b=aKaSEO7tLaebH3KBkkm8+8vk1FJVbbuavvzzuJEp02mi4qv/2QUAGOO1TbHpUv8uqSgV9SeM/QWQnpiy5BeYOLwtkVsTGMI2dUR1IX6Ez9x/Whu0OlvC+G1YOiC3FxoyVUSVx5lYkPl+sUgZZbBaZqAfIY5AKVasz7qCwbLISr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900592; c=relaxed/simple;
	bh=p/tbXoO5thb1nTi6kW+oVg6SjxAlvLFhd9eofC77fKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O76drrNSlYyLSEIo5XJtekZJbiNtSnQtHIO5zJ2aFqK09+CCswRNH4ilNGXdkUiUql/+aPIgbkOwxjHrVOajFDqztWn6EpMt+ING+cLFi6WxuI0sC2j/71HM05L5Nira1kgc4iEqj64tmI46QLevPBNc+trZUMqbgCF0fu4p31g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CutIXkU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YM719y7E+mTkz8X3h+0EF62k2rhu1PY3VU/uXfzYDg=;
	b=CutIXkU9StsGM5qZj7VV6/ZljMQO30Vfxa0iysmXVAcpZwkV4vPFmK8L/0Zertp7fhK6Ff
	/nfqS/oKMt1tiPJifj8wdQH1IpCwz46BWF3U9KdqtnydLCgP3paevgAnZ5nHJf8AabUgV2
	omZUQfrt0iw6fce42AuzazS8FqhL7UI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-pIi6mzgSOEWpbxei4jKU1g-1; Thu,
 12 Feb 2026 07:49:45 -0500
X-MC-Unique: pIi6mzgSOEWpbxei4jKU1g-1
X-Mimecast-MFC-AGG-ID: pIi6mzgSOEWpbxei4jKU1g_1770900583
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 443481955E88;
	Thu, 12 Feb 2026 12:49:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F8F430001BB;
	Thu, 12 Feb 2026 12:49:37 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com
Subject: [RFC PATCH v3 1/6] Documentation: extend the 'Function documentation' with expected behavior and constraints of use
Date: Thu, 12 Feb 2026 13:49:18 +0100
Message-ID: <20260212124923.222484-2-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,lists.elisa.tech,linuxfoundation.org,gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75911-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arndb.de,linux.dev,gmail.com,vger.kernel.org,googlegroups.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 404F312D893
X-Rspamd-Action: no action

Extend the longer description section of a function kernel-doc
header with an itemised list of function's behaviors and
constraints of use.
These are useful to link and trace test cases (e.g. KUnit) to
the different behavior IDs and define the constraints to be
met by the function's caller.

Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
---
 Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 8d2c09fb36e4..23e6c4b45b14 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -83,6 +83,25 @@ The general format of a function and function-like macro kernel-doc comment is::
    *
    * The longer description may have multiple paragraphs.
    *
+   * When specifying testable code behaviour the longer description must contain
+   * a paragraph formatted as follows:
+   *
+   * function_name behavior:
+   * [ID1] - [expected behavior]
+   *
+   * [ID2] - [expected behavior]
+   *
+   * [...]
+   *
+   * [IDn] - [expected behavior]
+   *
+   * function_name constraints of use:
+   * [ID1] - [constraint to be met by the caller]
+   *
+   * [ID2] - [constraint to be met by the caller]
+   *
+   * [IDn] - [constraint to be met by the caller]
+   *
    * Context: Describes whether the function can sleep, what locks it takes,
    *          releases, or expects to be held. It can extend over multiple
    *          lines.
-- 
2.48.1


