Return-Path: <linux-doc+bounces-79062-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KExUHtr+smmQRQAAu9opvQ
	(envelope-from <linux-doc+bounces-79062-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 18:58:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B05276E95
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 18:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D78030FC847
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 17:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5513FE37F;
	Thu, 12 Mar 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2HQ2Cea"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E7539D6E9
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338037; cv=none; b=LDV67kff+ndGAzG/Or5/9YXpQRkH8mT2PPAXvCu25eRVxx1UJWFmGehrCnMP+J83Ioa9HSEEA7tJ6xJgu7xMELzmwO705HjTw2Ps97afmIFPDJlHZz7yR+W5+BIv0KWJVPFk0ManuGUCqZHSVQGXGVNp7JIPik5JXuqsZG2jri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338037; c=relaxed/simple;
	bh=tEF3yhkGk7GJZbXxScXpV6WB7vdFV4j4XiHTGehOpVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksUUrnhNZZZ/54TK7RbB1iWlLlBvAD7/upEd7pT0xxQ8p1ejxaxOJdZwcM2bSZ9NvDx+jtQHjG3PEv5VcoTjwN1H0yr9mhkeFx7J4P6iAHDbgPT+hXnG2u02agbLbF9CNa8iy1basgZCFfcCOF01i0wcva5m6UgZ/h0II01oMRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2HQ2Cea; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae4e538abdso15126365ad.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773338036; x=1773942836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVWLPpAzQtONe2+RDE4AE36BbHIiMrCDRmv92u2lcVM=;
        b=b2HQ2Cea1O7SZhuLrNqbXYdKrGjzMzw3VJaV2TZCYg9VBaD6pcLuZMRJVnP3z+WcyK
         FpCq3HYOMdvR5Q7+Y9q2mMzCOG/1e0ojE597ZP/uV6Zl9j4UVJ9CgSoKwSEWgQpzlcPb
         3VZpem2ym/Wpu9j/aju5DeWb2R52xEzciGRuZl9IlkGTh0sLxTujXt5jvTKqxS78TTtL
         qjyC9SCJ84IIWivaaFzO5t0SJCy2aprMDNv7zbUt3VNefxxbaKykM+6+y6FHjwkPGOV8
         5bks8RRwSr7mn9azBn4MwCNjWrcBTUtj4ZclxFdDvgtUCWk3ZPnxS3Eg2B2ySuE4oNYh
         lAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338036; x=1773942836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVWLPpAzQtONe2+RDE4AE36BbHIiMrCDRmv92u2lcVM=;
        b=agu02vDmocFUX+3JQAV+vA4zDugpGQa5aPor6SHeIFoR2Aupvwv38G3cUMYJnwvShn
         SuN/6r/QVUy0hOgPY2nq+lGcgkbqGwJvvVdse14nUqu8v1EzyEmLrqPiY9ijbsl9U0lO
         t9U5rIrJN05yXHCEd2fJGBeuD6k4gAjZ/mnjBKOoyZAv4FDW6aujJ66T+iGb21g99ne+
         POc40on5f4T4ew8nYj2jeOuJNHBwdw3DED44zZ3AjpmRsmC70FDkWBTYbpOaitBhNzC3
         gt++utuNr7z8bSf2Umv1v35pEUc0I8X9U9iIAQXRVxzoAo9EZw++cAEAz+uNBEDtELuv
         a1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoaDaOKb/pjnTfOJ0B1oG9aavKttCvKAvXHmcY21zPJhZ4teCupMl7ElfVA05rIbTT63GCN1N4n0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8uEDnSyNdy3ZnVsDrh1Qtq55rloFa44vUsmsSMxBpdk842bZ
	FgvW0S8foSEx7XhDuTCrTF0YaZIxW8AihvYh1SP/lxA2fcYkrlOoq1in
X-Gm-Gg: ATEYQzyzj+bGgCv57w9b0FAFK+oX0hvd4OtS5oAlVj5RJUlt/c/Atm094HHDfbaA5nh
	/V8WcUCArBQazQxzjwItQVphHGdaalPQzA+HXHugUbFGwHT8UWd181FJJ9gyEu2UrjGV89cPxa9
	l69sf9Oq1msNZUEzxdgD9dEEeVhTccTkAxcLm8L3w44wzbsKicFJJiIiCSQiZXLOBXA+1n3EQy6
	HRf0xBJpAllOKtpsTp/4kywbgAgV7d7NVwSD7aAoVD1y7BPgjehJEVYjtrNTvYyqPXusIiKBh0N
	VCrmeIHRxn27eojbOma5+pRj34PzadiAKPjmI+DIKqAet/2QU4v+GBstiZdF6AT6MUHxhWZfq+n
	ZSdcGESur1JBDtp29p29RDnlNOhTI6spAJfyqhIBdWGLlXr7NOLmoDg3esQ9KbJw3/ZNDCaYz8+
	t+CgM2xhamWkTle/R+q27wKIv/ThOBhRIy2+dKbQot6qWtqW79da/Och14Z3bFXr1JN5A3UcLmz
	XQQn6wT8OBP18MZk7yum2xKGQFeGlnd8Wjd
X-Received: by 2002:a17:902:d542:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2aeca92183fmr3959315ad.1.1773338036145;
        Thu, 12 Mar 2026 10:53:56 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378ca7sm60453345ad.91.2026.03.12.10.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:53:55 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: djakov@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: marscheng@google.com,
	wllee@google.com,
	aarontian@google.com,
	jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/2] docs: interconnect: Improve API documentation coverage
Date: Thu, 12 Mar 2026 17:53:39 +0000
Message-ID: <20260312175341.2944154-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_CC(0.00)[google.com,ccns.ncku.edu.tw,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-79062-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[visitorckw@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2B05276E95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve the generic interconnect subsystem documentation by including
the existing kernel-doc comments from the source files.

Currently, the documentation only includes the provider data structures
from the header file and incorrectly states that consumer APIs are
undocumented.

Since drivers/interconnect/core.c contains a mix of both provider and
consumer APIs, this series uses the kernel-doc :functions: directive to
properly separate and document them in their respective sections.

Kuan-Wei Chiu (2):
  docs: interconnect: Add provider APIs to documentation
  docs: interconnect: Document consumer APIs and drop outdated text

 Documentation/driver-api/interconnect.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0.851.ga537e3e6e9-goog


