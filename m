Return-Path: <linux-doc+bounces-77859-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEn5Ax9aqGlxtgAAu9opvQ
	(envelope-from <linux-doc+bounces-77859-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 17:13:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C4203F0E
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 17:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 531FD30B7AAF
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 16:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D87534E745;
	Wed,  4 Mar 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="xpNtugTn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBF34BA50
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640031; cv=none; b=PO/JpKUIfMqglQ+spgE65jVllJ/Q5fXv7y7fgnNwnkiLNKo7+O5V4KVHNU9AWpHgckONDd9wiMBStNdIEA0Gqcu96FL4T3Uqel9vUxracZqXCy+xyd8faab4atWqKKV+SJ47bFuhHteqV5rbOCBYl9l1NF7z/fsZyePnU5+hCyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640031; c=relaxed/simple;
	bh=Uit1Ti7AU3XxeFhawNvwoDfVMeh6nJo+iBe3Dbimg88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5mIk5EaEvX8dNyS/Ee+o3HvsWBhd6MhMvU7aOOOlqPLr8Xiu/qsSl1Vzs9GNHF8DXo1MJIbtQxkS4OhWmlGRWvu1GFM6lH9rANMzn8rYxAW1AkuUb28+rPuY4+9kk0ZpT4VGAxOnFhit/cSP3xnkAv0aZ5ege/rZ0u89QM5rUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=xpNtugTn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so1095620f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640027; x=1773244827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9KLhKGx9RzUBsWoWUkwA/+vgETenzM1WQ8j317w0fU=;
        b=xpNtugTn5UkhZ0Lnj1qvpN3/EWbSA+Q7NtWSKHhiGKB85+u05ycJt2AN9tUrhAORh7
         hW+ribiQId7X1OKVlILOHPPh4w/TmVWNbsisyRB6ffJ34Vzazuplk05LwzGI7PNAcl5U
         a+zA90aBV1Dozsn2xQ19lB4SEP4M+3LvWhRAskqdlKCT2/49kNdf0633Cpkg/jpF7ntD
         SArn97nrknD8YfUqpQzAEJI/sgPJuRxXcFyCg3EPGuM0NLApF2sp1c/MBKdGMse3WcGY
         E/WNZK7o9QAXHrQMSZeTupaT9WPkuOs4CHpV8+2NziKLbUHnurL7UZwLXH1a6c2g1kH6
         9Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640027; x=1773244827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9KLhKGx9RzUBsWoWUkwA/+vgETenzM1WQ8j317w0fU=;
        b=VnLu0A98z1+13ipFPBKfGXCgaHN+82mAG3saz0F1A3mqQKRTzpAqz5YmMBF5Om1x+r
         N43+NJBovoO8cAcE8mMLeZ3WLBni5TwhVaAkcUhuEsqPTD79bIOmFX+fEnhlhULtnZ4r
         EdWCvFMVFWPoGbrsXcZ8RARWZuplnBx9VyZswl9Paor8Ju6FqiZmd4mZhcSBfGF4eeTk
         3ZFx0X2Ec1cGDA5Z5QyLWUDanVJl/n7icMKsP8dftk/g04MeHdBmW2oHs8NXNcZ23lvo
         1h48H23UwW3+mh0LU1Nt484XvsxB5BiqCdj/QOS6RCyzRrWrrcgTeevHcs5wNWFmAVTH
         UxGg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7EV7LyqTfuu9DDSNrReq+7++xxU68pFo4LJIwW/2HXOhRuJmUSom4zJymm8ivcjRfDG7674cjM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cU26I2okGECVSCOqtNc/u1dyeSmSI7KtDBU+M3yZXJ2P6S+C
	ScoXQ6I+bT6nykyaFp/IVNYe3PhDVu6KDISzaieSHVASrYG/msvhM0kNTgAJUfOC4R0=
X-Gm-Gg: ATEYQzyZcJdlKIEfUIvUq8AQuru0gRjjTI7Cy/h1O9C7dmZR174TORekd1nCHcB1PQC
	rgFY3tdNy/rbET7FOfF4P2YZG+hmjkWcNZUcnHOMj44MzNMyWzS38U4tPd9YJKSOxqLKBvfl4Lq
	rD1CylYh+6teQIfzxuYh/7gBto3ITzRdMjG04AljFb3ocTu9bKr5h9TopSx76ANUC+oJdSflHYW
	Rg8nppmEnhTC4tIIbubWVvfKLq7mjblYawqb70wOEdYBzd6MmX1SMq5OghwhqqIW04tdlqQldgy
	nxJUnGwLPSUpIw6XAk0ZFOmKjdPze0s6OFCL6gkhNgGhrAxZJaiKeQsBxiA+6rz2XVL/hQebZP+
	UkHFn2cv+NHd3OqFPKPeFYAGSFXzlJ8feLBjor9XRgvTmcX3jp9i6QTb05jmOnZRaG63nmzGt81
	EEXHNY5crYS3myuMK/PI+FFByk+KnxSNpepXFC4oO+VvXFjjYqqTo4qZC9
X-Received: by 2002:a05:6000:4006:b0:439:c279:32e9 with SMTP id ffacd0b85a97d-439c7fe3d7cmr4503831f8f.39.1772640026687;
        Wed, 04 Mar 2026 08:00:26 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm27629409f8f.39.2026.03.04.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:25 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	przemyslaw.kitszel@intel.com,
	mschmidt@redhat.com,
	andrew+netdev@lunn.ch,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	chuck.lever@oracle.com,
	matttbe@kernel.org,
	cjubran@nvidia.com,
	daniel.zahka@gmail.com,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH net-next v3 01/13] devlink: expose devlink instance index over netlink
Date: Wed,  4 Mar 2026 17:00:10 +0100
Message-ID: <20260304160022.6114-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304160022.6114-1-jiri@resnulli.us>
References: <20260304160022.6114-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 082C4203F0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,gmail.com,lwn.net,linuxfoundation.org,nvidia.com,intel.com,lunn.ch,goodmis.org,efficios.com,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77859-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Each devlink instance has an internally assigned index used for xarray
storage. Expose it as a new DEVLINK_ATTR_INDEX uint attribute alongside
the existing bus_name and dev_name handle.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/netlink/specs/devlink.yaml | 5 +++++
 include/uapi/linux/devlink.h             | 2 ++
 net/devlink/devl_internal.h              | 2 ++
 net/devlink/port.c                       | 1 +
 4 files changed, 10 insertions(+)

diff --git a/Documentation/netlink/specs/devlink.yaml b/Documentation/netlink/specs/devlink.yaml
index 837112da6738..1bed67a0eefb 100644
--- a/Documentation/netlink/specs/devlink.yaml
+++ b/Documentation/netlink/specs/devlink.yaml
@@ -867,6 +867,10 @@ attribute-sets:
         type: flag
         doc: Request restoring parameter to its default value.
         value: 183
+      -
+        name: index
+        type: uint
+        doc: Unique devlink instance index.
   -
     name: dl-dev-stats
     subset-of: devlink
@@ -1311,6 +1315,7 @@ operations:
           attributes:
             - bus-name
             - dev-name
+            - index
             - reload-failed
             - dev-stats
       dump:
diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
index e7d6b6d13470..1ba3436db4ae 100644
--- a/include/uapi/linux/devlink.h
+++ b/include/uapi/linux/devlink.h
@@ -642,6 +642,8 @@ enum devlink_attr {
 	DEVLINK_ATTR_PARAM_VALUE_DEFAULT,	/* dynamic */
 	DEVLINK_ATTR_PARAM_RESET_DEFAULT,	/* flag */
 
+	DEVLINK_ATTR_INDEX,			/* uint */
+
 	/* Add new attributes above here, update the spec in
 	 * Documentation/netlink/specs/devlink.yaml and re-generate
 	 * net/devlink/netlink_gen.c.
diff --git a/net/devlink/devl_internal.h b/net/devlink/devl_internal.h
index 1377864383bc..31fa98af418e 100644
--- a/net/devlink/devl_internal.h
+++ b/net/devlink/devl_internal.h
@@ -178,6 +178,8 @@ devlink_nl_put_handle(struct sk_buff *msg, struct devlink *devlink)
 		return -EMSGSIZE;
 	if (nla_put_string(msg, DEVLINK_ATTR_DEV_NAME, dev_name(devlink->dev)))
 		return -EMSGSIZE;
+	if (nla_put_uint(msg, DEVLINK_ATTR_INDEX, devlink->index))
+		return -EMSGSIZE;
 	return 0;
 }
 
diff --git a/net/devlink/port.c b/net/devlink/port.c
index 93d8a25bb920..1ff609571ea4 100644
--- a/net/devlink/port.c
+++ b/net/devlink/port.c
@@ -222,6 +222,7 @@ size_t devlink_nl_port_handle_size(struct devlink_port *devlink_port)
 
 	return nla_total_size(strlen(devlink->dev->bus->name) + 1) /* DEVLINK_ATTR_BUS_NAME */
 	     + nla_total_size(strlen(dev_name(devlink->dev)) + 1) /* DEVLINK_ATTR_DEV_NAME */
+	     + nla_total_size(8) /* DEVLINK_ATTR_INDEX */
 	     + nla_total_size(4); /* DEVLINK_ATTR_PORT_INDEX */
 }
 
-- 
2.51.1


