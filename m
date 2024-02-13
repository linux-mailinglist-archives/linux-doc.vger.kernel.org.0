Return-Path: <linux-doc+bounces-9165-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA458528BF
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 07:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BAEE1F2315E
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 06:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D9A134C0;
	Tue, 13 Feb 2024 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="LIVlLi8u"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9651B7FE
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707805033; cv=none; b=NWswy5+ZD48juR9+txTIbw2e/YKWm+SAGv90bVYHrkXbOzUQjEj1loTPjF5Wbh7u9X4axyeAaUdUoItSWXUdlL2TKmXv9DwHIBqierV5CbSN8RwLrSL+xgJZFrJzuYfvT++y6gD5QW/8f1YZJ5pTnNwaU4APGzXwMe9R1A5c0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707805033; c=relaxed/simple;
	bh=keBus4r+KHdtvzkIagi6GmmLRoV/Iu5G57t/XEMaSDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fldGVYSvEmwzi9wAGulsGNm1LRFMp4oDgRosr/jhzHWvuOfs+RuAqnR6C+smj23cBzFMXRuJeVFwi080c1/kZxbd0M8QEp9LLcu7O+6w/AAtKKhd1vYxqQ9tLjMJm6ZqUbn0TGXErH7qXy3yQACFfmSAZKcPRiWXwrqBPYZABjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=LIVlLi8u; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c033809f4bso1650649b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 22:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1707805030; x=1708409830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXoP2M02Y81OIisvdpEuqLXXw7KopR3yk8yAxza3E4Y=;
        b=LIVlLi8ujCIQNXEsW+nC9BqZydkEBMBSQ4dPeetnmCi4VHlXnjHCsjdkh+dtNm1Zv4
         tH2ABtf/oZnqVric6WgGeJTflMsDNbeoiSC/hEf6zAuUxkwTSkMFqsf6UX1X9XP18fEB
         S41qXSOPxF4+X4xmR0RwHdGr9Y9oS6O9UKVRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707805030; x=1708409830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXoP2M02Y81OIisvdpEuqLXXw7KopR3yk8yAxza3E4Y=;
        b=tUgr/gyq2AmVFbDgqZTYe3NdzVyjHV1gqnNzAZA69U6n7GCqwWvtkltyHdTZQaReud
         LjtzXGseGjk8UIy9dKU2I9fOQf8DLg0TyIwUZBaTgUQck3k5GBOHA3yL6IlzxfxhPeo5
         0ZJn9kOSS2kNYYv7sejOiRPmsJ+2zcmyzT6yd+OZTPqrSysIC9DotT80dWeyCJCjDwzj
         d2gySs5L27bbc8lIzQXhqLvVYg/dBJ1+VUZTe0Y1FlzQINGx6n29u6+tZEzdlV4MC3Zw
         p5+WgCq6K3/MQH45W2f4CdEOg4ycijS8i8uE83ihtP+GwIH4ZZE3niLlsujrpfotXr+V
         VIjA==
X-Forwarded-Encrypted: i=1; AJvYcCXnFKwmUhyOV44tAbirYIg4UmRZ4kBerKhwaTHtHkPuVZejdXiKCwOfnW9hPbGMHYYVHFHLas6YO0gudXAMvyFC3zNzCXF4dzpO
X-Gm-Message-State: AOJu0YzBtKBh7I5w/H6MRRonebTzEqK8+A+WvxmIfMhfSyKyaj/LM841
	EdrObpdTvZCTCrpDRTwufFR0J/9aBUMzkiaEPYb8WZpCiEPQH2K/UoWH9TMyaWA=
X-Google-Smtp-Source: AGHT+IHpZ+rOlMfDs1A1g6keFQGpRmuV8ztp07pgMPjzL++dbzQkwSCuoAh+dJwuGgcI0iY0xkNk3Q==
X-Received: by 2002:a05:6870:1681:b0:218:d8a0:69e2 with SMTP id j1-20020a056870168100b00218d8a069e2mr11392706oae.7.1707805030497;
        Mon, 12 Feb 2024 22:17:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzRDFeolDshuiT4chMcAX1qwSb4cjcuh+zAXZK3sWPgl+kSem+6ddHp0vng8xy2UBopU/rjhf1rVLKJMSidqIwajPleUxyxCKtTHsNgNrcG1pToS27rVvlKqgJqkCdLhxZvxvk3ThMRrwHeflrUnMyxgCIYW1xmDQQtVrRxOs9G4+b5eSfi1ZSpOfScm/NtOBbwxM54vN5gmG2LAQE5x5nkZwILfRVrp5v0PviODCADGfhQyQT1xtdtFBJwGkuEUi8I9Vt2viXCIpvHG7UPAvKCVDOpzyO5NuZHum6TSYLkjsiDWoj9eM/j9D2puhXpzC369Q8c+V9YE+Yu5k+jiOQLFo/xAqK2gDjM3D6XngcBlPMGkTRvaYKY9kLyZ0ca0ahtejbCDMmh6dihq5QFnrGQKbOIBLIAOEHfb5E7oMAuqhh17yM17r0+TOdUSeDi7bi1VQT4t97107D9EepePCdsQWQ/M2wSWDFsEakBkD9LpOs8X6aUfD9q5Z6XX2iAGHY07yABi/pSwAGwS6PggBhwXL9TIa0hxC2r7zw7PmJjz3X4Jg8jDU7p80dS44fiVB4sc9jF5ClkkJwBuLi7Te/iDQ3IUaKb/JalTRhtg+JvnRRoOj+7dJJ1CgEQbcHlGcdBfeSwAJzn3k3GQ/CWLbJTs7jHpWsAJIa2SkTaVvODllFsnSJ/J+LfDSUDjN2K4ubGLsrqpvkNYnqG2Npoe4sZBhU2mhdmoJ91ENqyw9V89o/Djvxk3c3zUAQUYPbU8k7B7X+Y4POAQrhvFlXIPlaskPMVRE+pxLICP6oSQOapxoMf1qWFB3gtUaUV82SGXXk4cWZKXv5n52EhvaHlZg4lbyqwMY2BVw6DHZQpP+lz6VMDGyF+tPOiJ7DhgRdHxPlPuF3WZ20LozSv7IqmRMz0UvRCuNmspCGqAk=
Received: from localhost.localdomain ([2620:11a:c018:0:ea8:be91:8d1:f59b])
        by smtp.gmail.com with ESMTPSA id n19-20020a638f13000000b005dc87f5dfcfsm342936pgd.78.2024.02.12.22.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:17:10 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: chuck.lever@oracle.com,
	jlayton@kernel.org,
	linux-api@vger.kernel.org,
	brauner@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	alexander.duyck@gmail.com,
	sridhar.samudrala@intel.com,
	kuba@kernel.org,
	willemdebruijn.kernel@gmail.com,
	weiwan@google.com,
	David.Laight@ACULAB.COM,
	arnd@arndb.de,
	sdf@google.com,
	amritha.nambiar@intel.com,
	Joe Damato <jdamato@fastly.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Julien Panis <jpanis@baylibre.com>,
	Steve French <stfrench@microsoft.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-fsdevel@vger.kernel.org (open list:FILESYSTEMS (VFS and infrastructure))
Subject: [PATCH net-next v8 4/4] eventpoll: Add epoll ioctl for epoll_params
Date: Tue, 13 Feb 2024 06:16:45 +0000
Message-Id: <20240213061652.6342-5-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213061652.6342-1-jdamato@fastly.com>
References: <20240213061652.6342-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ioctl for getting and setting epoll_params. User programs can use
this ioctl to get and set the busy poll usec time, packet budget, and
prefer busy poll params for a specific epoll context.

Parameters are limited:
  - busy_poll_usecs is limited to <= s32_max
  - busy_poll_budget is limited to <= NAPI_POLL_WEIGHT by unprivileged
    users (!capable(CAP_NET_ADMIN))
  - prefer_busy_poll must be 0 or 1
  - __pad must be 0

Signed-off-by: Joe Damato <jdamato@fastly.com>
Acked-by: Stanislav Fomichev <sdf@google.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 .../userspace-api/ioctl/ioctl-number.rst      |  1 +
 fs/eventpoll.c                                | 73 +++++++++++++++++++
 include/uapi/linux/eventpoll.h                | 13 ++++
 3 files changed, 87 insertions(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 457e16f06e04..b33918232f78 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -309,6 +309,7 @@ Code  Seq#    Include File                                           Comments
 0x89  0B-DF  linux/sockios.h
 0x89  E0-EF  linux/sockios.h                                         SIOCPROTOPRIVATE range
 0x89  F0-FF  linux/sockios.h                                         SIOCDEVPRIVATE range
+0x8A  00-1F  linux/eventpoll.h
 0x8B  all    linux/wireless.h
 0x8C  00-3F                                                          WiNRADiO driver
                                                                      <http://www.winradio.com.au/>
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 1b8d01af0c2c..df2ed3af486e 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -37,6 +37,7 @@
 #include <linux/seq_file.h>
 #include <linux/compat.h>
 #include <linux/rculist.h>
+#include <linux/capability.h>
 #include <net/busy_poll.h>
 
 /*
@@ -494,6 +495,49 @@ static inline void ep_set_busy_poll_napi_id(struct epitem *epi)
 	ep->napi_id = napi_id;
 }
 
+static long ep_eventpoll_bp_ioctl(struct file *file, unsigned int cmd,
+				  unsigned long arg)
+{
+	struct eventpoll *ep = file->private_data;
+	void __user *uarg = (void __user *)arg;
+	struct epoll_params epoll_params;
+
+	switch (cmd) {
+	case EPIOCSPARAMS:
+		if (copy_from_user(&epoll_params, uarg, sizeof(epoll_params)))
+			return -EFAULT;
+
+		/* pad byte must be zero */
+		if (epoll_params.__pad)
+			return -EINVAL;
+
+		if (epoll_params.busy_poll_usecs > S32_MAX)
+			return -EINVAL;
+
+		if (epoll_params.prefer_busy_poll > 1)
+			return -EINVAL;
+
+		if (epoll_params.busy_poll_budget > NAPI_POLL_WEIGHT &&
+		    !capable(CAP_NET_ADMIN))
+			return -EPERM;
+
+		WRITE_ONCE(ep->busy_poll_usecs, epoll_params.busy_poll_usecs);
+		WRITE_ONCE(ep->busy_poll_budget, epoll_params.busy_poll_budget);
+		WRITE_ONCE(ep->prefer_busy_poll, epoll_params.prefer_busy_poll);
+		return 0;
+	case EPIOCGPARAMS:
+		memset(&epoll_params, 0, sizeof(epoll_params));
+		epoll_params.busy_poll_usecs = READ_ONCE(ep->busy_poll_usecs);
+		epoll_params.busy_poll_budget = READ_ONCE(ep->busy_poll_budget);
+		epoll_params.prefer_busy_poll = READ_ONCE(ep->prefer_busy_poll);
+		if (copy_to_user(uarg, &epoll_params, sizeof(epoll_params)))
+			return -EFAULT;
+		return 0;
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 #else
 
 static inline bool ep_busy_loop(struct eventpoll *ep, int nonblock)
@@ -505,6 +549,12 @@ static inline void ep_set_busy_poll_napi_id(struct epitem *epi)
 {
 }
 
+static long ep_eventpoll_bp_ioctl(struct file *file, unsigned int cmd,
+				  unsigned long arg)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_NET_RX_BUSY_POLL */
 
 /*
@@ -864,6 +914,27 @@ static void ep_clear_and_put(struct eventpoll *ep)
 		ep_free(ep);
 }
 
+static long ep_eventpoll_ioctl(struct file *file, unsigned int cmd,
+			       unsigned long arg)
+{
+	int ret;
+
+	if (!is_file_epoll(file))
+		return -EINVAL;
+
+	switch (cmd) {
+	case EPIOCSPARAMS:
+	case EPIOCGPARAMS:
+		ret = ep_eventpoll_bp_ioctl(file, cmd, arg);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int ep_eventpoll_release(struct inode *inode, struct file *file)
 {
 	struct eventpoll *ep = file->private_data;
@@ -970,6 +1041,8 @@ static const struct file_operations eventpoll_fops = {
 	.release	= ep_eventpoll_release,
 	.poll		= ep_eventpoll_poll,
 	.llseek		= noop_llseek,
+	.unlocked_ioctl	= ep_eventpoll_ioctl,
+	.compat_ioctl   = compat_ptr_ioctl,
 };
 
 /*
diff --git a/include/uapi/linux/eventpoll.h b/include/uapi/linux/eventpoll.h
index cfbcc4cc49ac..4f4b948ef381 100644
--- a/include/uapi/linux/eventpoll.h
+++ b/include/uapi/linux/eventpoll.h
@@ -85,4 +85,17 @@ struct epoll_event {
 	__u64 data;
 } EPOLL_PACKED;
 
+struct epoll_params {
+	__u32 busy_poll_usecs;
+	__u16 busy_poll_budget;
+	__u8 prefer_busy_poll;
+
+	/* pad the struct to a multiple of 64bits */
+	__u8 __pad;
+};
+
+#define EPOLL_IOC_TYPE 0x8A
+#define EPIOCSPARAMS _IOW(EPOLL_IOC_TYPE, 0x01, struct epoll_params)
+#define EPIOCGPARAMS _IOR(EPOLL_IOC_TYPE, 0x02, struct epoll_params)
+
 #endif /* _UAPI_LINUX_EVENTPOLL_H */
-- 
2.25.1


