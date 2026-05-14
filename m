Return-Path: <linux-doc+bounces-87549-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLuVOCRMBmqUiQIAu9opvQ
	(envelope-from <linux-doc+bounces-87549-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 00:26:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D106D5476D1
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 00:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DE73011EA9
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 22:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA173D2FE0;
	Thu, 14 May 2026 22:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DWM+GPvU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05F038F939
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797597; cv=none; b=fhjIH0QEhKiEQ+03FzUPjuwaQovHBfRzK4CrPqywH8DE7gYXCFgfuIfcimRfA2RbWpEWgWckTyV4cUddL8NTYP8q8DiyZH2D4rSxSUVWGgf26AJ5e8O806a2uB/KT9cxDQPrKNukKsxAY9NjHo1RQAZDsL8IDiLmxo7aQaba/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797597; c=relaxed/simple;
	bh=ZiieCgvQr10bJWZl83vVIkp0x1RhpipuOsxCe6TWm10=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du+I9eXQsgphJv3vSBubTTzRZmHV7340yz0S4hh4RGW3Q6i8dv8BKrBffu6B362um5mg4hKtoWeK262gB4OeYhe7qEbm1cF6H4Wq3QwMAMTP30VuZ6q+Tj5e+cN4G0uWGSgBxqeM/jTty75LB+orFzYdgR87nXGHXPMfHtPRTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DWM+GPvU; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d6ab4476eso79404581cf.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797595; x=1779402395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNYZS3s0Ezy+RQHVqVYSzxTe1QiuBpPaay8EBa5d/Xw=;
        b=DWM+GPvUCLHiD8HtHcxflKwcWomGBNlyfhu4QJKmNGGLMBYYcdIoiz/r2Y7k6xBLpk
         sUdaG14uE38lhr/Y/8NPYn82cNwv/qlvFw2TK9HVYkKB4NvZCygrxfAU95Y9AzS1p2Ps
         zmSOrtfhBGiR/T4a5jdsi6CNvtlExvVk7eo9/9SUA0nCbLVUzBbaFBxRq/FVNaUufE9m
         bO7HSyOG8aQA/AQPmvk8adjYBbZQJ5lXnGpNKJajtZBRBVxCYl14DOLgqOMpLm1k0LoU
         wKMdsYCyqYOZqT2z800PXFctCMnobF7jlmqXHAEy6N6kKHETJ8NpdlhQ4+BpsQi/71cT
         hpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797595; x=1779402395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNYZS3s0Ezy+RQHVqVYSzxTe1QiuBpPaay8EBa5d/Xw=;
        b=P/wId+KAOHHG/T5SG3hcvVlyqSIfKcMqajdv0gJf3PUbdosm78E5CMwvfiGxd2B/vg
         h2ZJRQcqshBZgHBugr28sJMejc7vlq3tyaHSd57n0vSDy2lhwCv5Yn7x8tI/AWLauP4W
         groXFUS5HfSRhYEP2ZeOnG/NRKsrHhjAik75UeUHcVqyIQpPGebc4RAauGmHdCeH15RD
         uczLJeDTFJ7v19Ecn2P8VPq0iwBVQNqTpSOWvEo2Y64l84sCzCTrHswCGUkf32v9IUIR
         eMIKXmWvSA20SOnnKIecdzjQeZuDyBTbJk08y7YtK/eHsYy7lM4sAKyO+jTcZDL/4Eh3
         dsTw==
X-Forwarded-Encrypted: i=1; AFNElJ8W8sEJmLbm6DpdlWXHVSFjY7/2P/d/e3MVpONW6/jE3LNUH+qNgrD/YQIrqGd2/uuTJ7s9p8ovSXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG1V2Wh8HHj09OvS0hOkqZfsDKN16OuceiWkff4QftYrOfLAh2
	8ESe8eGddWNIPoNCfJ2o7ieDMNYxfRe9EyXoTJ6Echgd5WCVXvIKI7tM09NmND9aq0I=
X-Gm-Gg: Acq92OHWQXpY8E5XHQhGIcU1LQrVpeMfnbtgDn40t+45QgcWZeuUxEUfhgRDov2C8PN
	Dfx1qIn7UktRGHrMtvZZsdWBOZ/b0A5a5eZVNRFa8cuxHf7fyiu1PVhIA4Ov+kGLaszelQd/n9P
	Y/KkOF7Yjkm8qarg1oCzutLiddzU2Mo8raxhFmX1FNgCWzmGnZGY1ojvkDzBTR4BuDj8L1Z0JmQ
	2YBB/IoWUoLZNcbmV2kmhYM3l6NH467V5C4350/EgHBjsBa4nHLw6YQ7wIM4AuQXuuXB8LdxeYy
	OTBBKyulGC3NULcjby33HqUyjFEIKxE7oAkzHTubtLD+cQhIRFrUxTzvAMxgGhMjA/6qVpO+faS
	5NfE032qTIUQT5sC+jsI6Fl3yD89VZgN7gHEYXcKA6iPRuwqe8s/Nrs0XdGXDyXsnwkpXtEa/BX
	2atahv6jKP2FLQyomTSdd5SU9yNUO5loBevVjI7HOcS7jjRN5aIXE=
X-Received: by 2002:ac8:7dcd:0:b0:50e:6055:274e with SMTP id d75a77b69052e-5165a025376mr20219891cf.17.1778797595002;
        Thu, 14 May 2026 15:26:35 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:34 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one helper
Date: Thu, 14 May 2026 22:26:20 +0000
Message-ID: <20260514222628.931312-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D106D5476D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[soleen.com:+];
	TAGGED_FROM(0.00)[bounces-87549-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soleen.com:email,soleen.com:mid,soleen.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Extract the logic for deserializing single entries for files into
separate helper functions. In preparation to a linked-block
serialization for files.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a0a419085e28..a2510563469a 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -752,6 +752,46 @@ int luo_file_finish(struct luo_file_set *file_set)
 	return 0;
 }
 
+static int luo_file_deserialize_one(struct luo_file_set *file_set,
+				    struct luo_file_ser *ser)
+{
+	struct liveupdate_file_handler *fh;
+	bool handler_found = false;
+	struct luo_file *luo_file;
+
+	down_read(&luo_register_rwlock);
+	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
+		if (!strcmp(fh->compatible, ser->compatible)) {
+			if (try_module_get(fh->ops->owner))
+				handler_found = true;
+			break;
+		}
+	}
+	up_read(&luo_register_rwlock);
+
+	if (!handler_found) {
+		pr_warn("No registered handler for compatible '%.*s'\n",
+			(int)sizeof(ser->compatible),
+			ser->compatible);
+		return -ENOENT;
+	}
+
+	luo_file = kzalloc_obj(*luo_file);
+	if (!luo_file) {
+		module_put(fh->ops->owner);
+		return -ENOMEM;
+	}
+
+	luo_file->fh = fh;
+	luo_file->file = NULL;
+	luo_file->serialized_data = ser->data;
+	luo_file->token = ser->token;
+	mutex_init(&luo_file->mutex);
+	list_add_tail(&luo_file->list, &file_set->files_list);
+
+	return 0;
+}
+
 /**
  * luo_file_deserialize - Reconstructs the list of preserved files in the new kernel.
  * @file_set:     The incoming file_set to fill with deserialized data.
@@ -781,6 +821,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	int err;
 	u64 i;
 
 	if (!file_set_ser->files) {
@@ -808,39 +849,9 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 */
 	file_ser = file_set->files;
 	for (i = 0; i < file_set->count; i++) {
-		struct liveupdate_file_handler *fh;
-		bool handler_found = false;
-		struct luo_file *luo_file;
-
-		down_read(&luo_register_rwlock);
-		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
-			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
-				if (try_module_get(fh->ops->owner))
-					handler_found = true;
-				break;
-			}
-		}
-		up_read(&luo_register_rwlock);
-
-		if (!handler_found) {
-			pr_warn("No registered handler for compatible '%.*s'\n",
-				(int)sizeof(file_ser[i].compatible),
-				file_ser[i].compatible);
-			return -ENOENT;
-		}
-
-		luo_file = kzalloc_obj(*luo_file);
-		if (!luo_file) {
-			module_put(fh->ops->owner);
-			return -ENOMEM;
-		}
-
-		luo_file->fh = fh;
-		luo_file->file = NULL;
-		luo_file->serialized_data = file_ser[i].data;
-		luo_file->token = file_ser[i].token;
-		mutex_init(&luo_file->mutex);
-		list_add_tail(&luo_file->list, &file_set->files_list);
+		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.53.0


