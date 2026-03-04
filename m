Return-Path: <linux-doc+bounces-77860-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH51LoNbqGmZtgAAu9opvQ
	(envelope-from <linux-doc+bounces-77860-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 17:19:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5180E204132
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 17:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BCF0330D4AA
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 16:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1350E3537F9;
	Wed,  4 Mar 2026 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HKgeK19B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4D34BA50
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640033; cv=none; b=N29C8VFtrULZozMOpFKokaKZoO5hkpnD2eenbZwqr8vVYyD4W0YeqUAj6dvCuBTwDoTjwKcZQtkmJQzutFIB0/z4HnNYRcjC4Mawz8n8Nz3AZBeYKO6lfkHyPFPMLs2QpiLCB0730ZizLZpKsXLdrDRz/RuT0HzllKfLJnRDRiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640033; c=relaxed/simple;
	bh=Vtm80qE6FuR56bwzyqwTxutZyqLSGPZTe2b3PkwM178=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cj9PZTb5sQQQPU/FCAnKu19Bw/+QrKdLZiXVZ3MJ1TYpGHh5L674Kl5jRVUgg03sd/u5jry1L4DBUi3egGtud4EmPsXJbqJIrC/PHfODJfUun+RK0xNvEoQHzKlOXWba0FQnpxu/O6wlUi6NeA31bEZuVMRF6Bc7EiJv03pzuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=HKgeK19B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4833115090dso71972205e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640030; x=1773244830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEWuug6YBMXUGRBONZQ2DbkIBf5q1GxD8BXyAd3vMMw=;
        b=HKgeK19BNnN/xfBdG3TeGtmGL4/I6csuNySXiK2cvgGVrlXff2jFACmEtRqt1l/BkT
         QS8uWnklsDMoiQGl9zO7SZwouW09GKKmMpK346Hlh5FEVTSNPBKXJ6jfQX15eXo1TdRF
         qlVD3h9UmKOPLDS//iY+ytByE8MGw49FZJ0V0I0NzZ1BCn2jCs591b0RE/Xpp3PoKF8s
         azTOhDeI7RpNIvy6vt/0kOKU8R7hgiFVSrd+0v6JuY2LYxG0CGCXMVcyGIdRmjW52VlM
         4zNYfYKPVl2jeoGMmQvDQRvR4toe5Z0JohC8zilCe0XoTEYzmcCm5+YF44VzPCPnLl7f
         dLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640030; x=1773244830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HEWuug6YBMXUGRBONZQ2DbkIBf5q1GxD8BXyAd3vMMw=;
        b=IFWITJAwUZXh9/Wk1ef5l4mKP6AN2hmD0DyDmCMW/EiGOw75x2eWwox+IVC1h/d+Vg
         s7w2tyHTbeY36/T3hnJc2QXRVeLqccioGbTE6fv7Skoy8o0kD6wX4Ir/N/ojknhMLmOW
         8FfwL1jWKZQbWsszLR2Cjmh7GVwLcPGyWzpTzJPILLNMvwSZHYQAP3lgOmGt34/a4fS9
         GXKkvMkpRbGwK4VKZNqX9Pdd9LT6hxuOPOqxN+Z8TIR463q3KrCqthN01NH8iKn0pjjI
         HzG3ziTI8TV5KOSz0SUyMmCwPtNRyERyL4nFMCupYIeztmbiqLXx46rTsW6SmN2dGgam
         eYhg==
X-Forwarded-Encrypted: i=1; AJvYcCW77FnLLwkUjH1eu8tpadEbwM6LuYsL0aP2DuIVK30g5rV5klJ2bhnKQMpb9m2XQqjVcRY9q8AVAaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZXQ+XH3hBOj/wM9gs+FR4kzSwIB/pGsK9MkOpX2gliUz1yPlN
	htXoGHgAos4Ph+Xn/322dbqUw00um0TBmziX+TYY5jFtnlSM8JR7u/4P/zjeRCvZqNg=
X-Gm-Gg: ATEYQzxeuMa9UBo6SSV54hhxEX9xDtNHZQ/kBhtQdRZ5foIAGz2yGislUCsCUPxFOyc
	q/brJyLq/XxDMe54uHTw9QHljONNLJzxr9JSN+3be8XzxVFII7t75fPqO1XfiDYBgWCQuQ/8cqT
	7jMVnlAFsxsG1f9K4JxvetkhtJxYgOLLgWWg3iYc4d59l307QkVe4cxP6P7nJ8a22LbIEa81SiH
	RnncMX/jGLi841nUMyXZTd62ltKmtSCtGA+wPiBBB/rpKnv2Zs3kozAHPaCYIgokCzpzP7Y0BR4
	jLc2EWHC1MGQL+5c61FYnTGy+WSrRhB8YdeYjww+GN4z8122nWpm8nQ7D6KK1EijC3cyXUHBF2E
	kWRU/Dy5EtvZ1zBrlzR1fsI5GVQciQqRcjES3VISSlc1kJGAw/ZpDFqpaffY79fzNfiUciRtsMZ
	/ci5kAxbGkfRVBfUKGVpF6T3To0+LYOuVG9N1ljGn5liP2IA==
X-Received: by 2002:a05:600c:1c21:b0:483:71f7:2794 with SMTP id 5b1f17b1804b1-48519866866mr45713755e9.15.1772640030032;
        Wed, 04 Mar 2026 08:00:30 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187ced3bsm56749265e9.8.2026.03.04.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:29 -0800 (PST)
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
Subject: [PATCH net-next v3 03/13] devlink: avoid extra iterations when found devlink is not registered
Date: Wed,  4 Mar 2026 17:00:12 +0100
Message-ID: <20260304160022.6114-4-jiri@resnulli.us>
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
X-Rspamd-Queue-Id: 5180E204132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,gmail.com,lwn.net,linuxfoundation.org,nvidia.com,intel.com,lunn.ch,goodmis.org,efficios.com,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77860-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Since the one found is not registered, very unlikely another one with
the same bus_name/dev_name is going to be found. Stop right away and
prepare common "found" path for the follow-up patch.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 net/devlink/netlink.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
index 56817b85a3f9..7b205f677b7a 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -194,16 +194,20 @@ devlink_get_from_attrs_lock(struct net *net, struct nlattr **attrs,
 
 	devlinks_xa_for_each_registered_get(net, index, devlink) {
 		if (strcmp(devlink_bus_name(devlink), busname) == 0 &&
-		    strcmp(devlink_dev_name(devlink), devname) == 0) {
-			devl_dev_lock(devlink, dev_lock);
-			if (devl_is_registered(devlink))
-				return devlink;
-			devl_dev_unlock(devlink, dev_lock);
-		}
+		    strcmp(devlink_dev_name(devlink), devname) == 0)
+			goto found;
 		devlink_put(devlink);
 	}
 
 	return ERR_PTR(-ENODEV);
+
+found:
+	devl_dev_lock(devlink, dev_lock);
+	if (devl_is_registered(devlink))
+		return devlink;
+	devl_dev_unlock(devlink, dev_lock);
+	devlink_put(devlink);
+	return ERR_PTR(-ENODEV);
 }
 
 static int __devlink_nl_pre_doit(struct sk_buff *skb, struct genl_info *info,
-- 
2.51.1


