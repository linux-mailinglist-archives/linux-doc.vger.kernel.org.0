Return-Path: <linux-doc+bounces-63602-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79466BE648B
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 06:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 335A0407C34
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 04:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C216F30DD02;
	Fri, 17 Oct 2025 04:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeUbD9kJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050730CD9F
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675020; cv=none; b=KQ8fImsm1TcV14qAH1Wq0adeFQqQ6jKe8TGWfNfrHisqbeM3tAt/4Qp4AsVTmnoqCML0tv/qPW/njHnVQdvJkGUeClM0rXIP1IcSGjtXwoX7zWV6SKFRNiwOVnitrNyxafh+WppAWo1w39whXI1XDwWvFNzzmLQyh9eK8u1KtJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675020; c=relaxed/simple;
	bh=duddJN0kQkHYKxRPfiW8CpFJ4dQVX39UNzxDdQSpByw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLs5lN0grc+IxkDNYS+/8O6Bm9vKt6p83XFB7E3ioJyL5DFQhCUa+hZPlI6vM/3kZ7sc5No1tP+9vUTb5isBJWYXyWWHiRuZ5T5R5CgTkxn4a2z4t844d8U2WSlYN0U+sR1a8Ov4fs5U3Liho0VYn+0uf10HmcJJBQyYIVaQ+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeUbD9kJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f343231fcso980360b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 21:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675018; x=1761279818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjVILfauIufUxhc7OT1sVnMmTMxe8Z64uh1TdUKNmZM=;
        b=BeUbD9kJLnxKuXC5CodC5/RJB8Wn5N6uwaf23vD+xxE3p5mXTx9bMBDmzc9l/3hmmA
         tqB77z3a/ntjyeiiCC3HZ93Ojutn9RqJwBgsVA56qRucf072R5U0QbgwalS8RbEj0Ovh
         YegEaZLTpAr6iCK8Xm4C/JeCtLDmZ4NdVhuIL/vH6Y1H2adqaAKyWoMKBDtZHRgCNIdu
         yTqNDsc7el4Nvgx0o/2JGFBtDhHuQHrTiUxfSkHfq8FBvYZevlJSWGvndIQckALPe+sS
         arSGcFAner0wXyKz9q/DNeIFmWSPHPkOanIMOj86XQSQoWf5suBwPX1Xw/G9Nk1AW1j4
         gQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675018; x=1761279818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjVILfauIufUxhc7OT1sVnMmTMxe8Z64uh1TdUKNmZM=;
        b=UbbPsKXjzUQCGAiVlC1zcFiEVvUarwHq9c20jFP/Nr63PuU9ckkC45fMNH7p1WfJ57
         +xBbnM1sYHoN/Ffw921w45Z4wkd+fmAUqQBElxAADA1lZh+cDm6n8eDs+uLIdU4RcfU3
         sgztKIlnvOa887iTY0TR7XFxJAkIzH/+tP8CqHyNiPL/0L89SP8wi5DKQOrPiHaG0W98
         MuOPyy79Zmfn0z6q5Voy17P+5P2wIFIWycR3QLbdh7jv3em0s4MhRW/Ifl23I7krLIT7
         Ak5YnwIE/AOkv0sKp6Akv0zMZ4KtOULh2aKB2pAo7jjLVSOO4TbyfqRNzt/G9ZRD1QN4
         OQvw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ld61sx/fjVQBJ0ZUmqIruYhqi88hzk490QDkDLjcRvTDtmUPmjNT2nmIIh0dz+TI8Ekzq8dk4CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQy8s1WZcXSF53BPaUms9q+lVTNKvBttg99aZrGgcwvb3WPWD
	bBCcFFK35QauH0LaDMAvpB4nF+kx9UEkCGtntQ4sQMAVKodf6OJldeA5
X-Gm-Gg: ASbGncv8IbdeqxFG+jCmwsuCpnPSyoTd3qVcjkOPXkcTlirDCzsBw8EAnykjfp7sOU9
	eUguzv4uvSFuxWHuKqXsq4PRGQ9BHzITBlbhlycZgGrgWRBv5VBMHs4psQV5fW8Hc4DYedTYrWl
	6Np4Z2a9KoKCFM2mN7pe+g3hSqXp12gKc+y15evPyD7P2ZMTiI44lafj1MsWxmFdquVLaFZCnl2
	rqGtD04bL1jPqRDCPQk5kL+kL6KHsuuS9JkjxYbo0O3H3gEc6RNjA1Y3nkaQvIm7lvBOnX+SBnT
	I10STMLx7He56SMKwHjDGrdSRsqVLFUHK1N8aaPeCRH4WbQmxKJbePAkbimJ1bHrXi0dseYQgUj
	WeWkQAQkebuEo7qD3agJbwQTQGLnOA+em1f5ihwBdTKtpzAGix3tqmgGTW/lbyAbdRX4r4Y1mIs
	PQvp6MJfAgYFINpyn3ln/FRXkx26P7l6GpS9g7aFz31EmIwL+KrZaWXQHlUgjau9rkOnD7fXvqX
	Wjp0Tl+6sBjQkg9ZYJH
X-Google-Smtp-Source: AGHT+IE8tGIqKknBmSR/YjZ0JxDzGHwDUZlXi4SXMFnGrMTTa5U7E8C9N7e2anx+wAKtOY9fgQgPgw==
X-Received: by 2002:a05:6a20:3d84:b0:2b3:4f2a:d2e9 with SMTP id adf61e73a8af0-334a8515183mr2709377637.9.1760675018085;
        Thu, 16 Oct 2025 21:23:38 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:37 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 1/7] net/handshake: Store the key serial number on completion
Date: Fri, 17 Oct 2025 14:23:06 +1000
Message-ID: <20251017042312.1271322-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017042312.1271322-1-alistair.francis@wdc.com>
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Allow userspace to include a key serial number when completing a
handshake with the HANDSHAKE_CMD_DONE command.

We then store this serial number and will provide it back to userspace
in the future. This allows userspace to save data to the keyring and
then restore that data later.

This will be used to support the TLS KeyUpdate operation, as now
userspace can resume information about a established session.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reincke <hare@suse.de>
---
v4:
 - No change
v3:
 - No change
v2:
 - Change "key-serial" to "session-id"

 Documentation/netlink/specs/handshake.yaml |  4 ++++
 Documentation/networking/tls-handshake.rst |  2 ++
 drivers/nvme/host/tcp.c                    |  3 ++-
 drivers/nvme/target/tcp.c                  |  3 ++-
 include/net/handshake.h                    |  4 +++-
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 +++--
 net/handshake/tlshd.c                      | 15 +++++++++++++--
 net/sunrpc/svcsock.c                       |  4 +++-
 net/sunrpc/xprtsock.c                      |  4 +++-
 10 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentation/netlink/specs/handshake.yaml
index 95c3fade7a8d..a273bc74d26f 100644
--- a/Documentation/netlink/specs/handshake.yaml
+++ b/Documentation/netlink/specs/handshake.yaml
@@ -87,6 +87,9 @@ attribute-sets:
         name: remote-auth
         type: u32
         multi-attr: true
+      -
+        name: session-id
+        type: u32
 
 operations:
   list:
@@ -123,6 +126,7 @@ operations:
             - status
             - sockfd
             - remote-auth
+            - session-id
 
 mcast-groups:
   list:
diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/networking/tls-handshake.rst
index 6f5ea1646a47..d7287890056a 100644
--- a/Documentation/networking/tls-handshake.rst
+++ b/Documentation/networking/tls-handshake.rst
@@ -60,6 +60,8 @@ fills in a structure that contains the parameters of the request:
         key_serial_t    ta_my_privkey;
         unsigned int    ta_num_peerids;
         key_serial_t    ta_my_peerids[5];
+        key_serial_t    user_session_id;
+
   };
 
 The @ta_sock field references an open and connected socket. The consumer
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 2751c15beed6..611be56f8013 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1691,7 +1691,8 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		qid, queue->io_cpu);
 }
 
-static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid)
+static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
+	key_serial_t user_session_id)
 {
 	struct nvme_tcp_queue *queue = data;
 	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 470bf37e5a63..4ef4dd140ada 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1780,7 +1780,8 @@ static int nvmet_tcp_tls_key_lookup(struct nvmet_tcp_queue *queue,
 }
 
 static void nvmet_tcp_tls_handshake_done(void *data, int status,
-					 key_serial_t peerid)
+					 key_serial_t peerid,
+					 key_serial_t user_session_id)
 {
 	struct nvmet_tcp_queue *queue = data;
 
diff --git a/include/net/handshake.h b/include/net/handshake.h
index 8ebd4f9ed26e..dc2222fd6d99 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -18,7 +18,8 @@ enum {
 };
 
 typedef void	(*tls_done_func_t)(void *data, int status,
-				   key_serial_t peerid);
+				   key_serial_t peerid,
+				   key_serial_t user_session_id);
 
 struct tls_handshake_args {
 	struct socket		*ta_sock;
@@ -31,6 +32,7 @@ struct tls_handshake_args {
 	key_serial_t		ta_my_privkey;
 	unsigned int		ta_num_peerids;
 	key_serial_t		ta_my_peerids[5];
+	key_serial_t		user_session_id;
 };
 
 int tls_client_hello_anon(const struct tls_handshake_args *args, gfp_t flags);
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 662e7de46c54..b68ffbaa5f31 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -55,6 +55,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_SESSION_ID,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)
diff --git a/net/handshake/genl.c b/net/handshake/genl.c
index f55d14d7b726..6cdce7e5dbc0 100644
--- a/net/handshake/genl.c
+++ b/net/handshake/genl.c
@@ -16,10 +16,11 @@ static const struct nla_policy handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
 };
 
 /* HANDSHAKE_CMD_DONE - do */
-static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] = {
+static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_SESSION_ID + 1] = {
 	[HANDSHAKE_A_DONE_STATUS] = { .type = NLA_U32, },
 	[HANDSHAKE_A_DONE_SOCKFD] = { .type = NLA_S32, },
 	[HANDSHAKE_A_DONE_REMOTE_AUTH] = { .type = NLA_U32, },
+	[HANDSHAKE_A_DONE_SESSION_ID] = { .type = NLA_U32, },
 };
 
 /* Ops table for handshake */
@@ -35,7 +36,7 @@ static const struct genl_split_ops handshake_nl_ops[] = {
 		.cmd		= HANDSHAKE_CMD_DONE,
 		.doit		= handshake_nl_done_doit,
 		.policy		= handshake_done_nl_policy,
-		.maxattr	= HANDSHAKE_A_DONE_REMOTE_AUTH,
+		.maxattr	= HANDSHAKE_A_DONE_SESSION_ID,
 		.flags		= GENL_CMD_CAP_DO,
 	},
 };
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index 081093dfd553..2549c5dbccd8 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -26,7 +26,8 @@
 
 struct tls_handshake_req {
 	void			(*th_consumer_done)(void *data, int status,
-						    key_serial_t peerid);
+						    key_serial_t peerid,
+						    key_serial_t user_session_id);
 	void			*th_consumer_data;
 
 	int			th_type;
@@ -39,6 +40,8 @@ struct tls_handshake_req {
 
 	unsigned int		th_num_peerids;
 	key_serial_t		th_peerid[5];
+
+	key_serial_t		user_session_id;
 };
 
 static struct tls_handshake_req *
@@ -55,6 +58,7 @@ tls_handshake_req_init(struct handshake_req *req,
 	treq->th_num_peerids = 0;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
+	treq->user_session_id = TLS_NO_PRIVKEY;
 	return treq;
 }
 
@@ -83,6 +87,13 @@ static void tls_handshake_remote_peerids(struct tls_handshake_req *treq,
 		if (i >= treq->th_num_peerids)
 			break;
 	}
+
+	nla_for_each_attr(nla, head, len, rem) {
+		if (nla_type(nla) == HANDSHAKE_A_DONE_SESSION_ID) {
+			treq->user_session_id = nla_get_u32(nla);
+			break;
+		}
+	}
 }
 
 /**
@@ -105,7 +116,7 @@ static void tls_handshake_done(struct handshake_req *req,
 		set_bit(HANDSHAKE_F_REQ_SESSION, &req->hr_flags);
 
 	treq->th_consumer_done(treq->th_consumer_data, -status,
-			       treq->th_peerid[0]);
+			       treq->th_peerid[0], treq->user_session_id);
 }
 
 #if IS_ENABLED(CONFIG_KEYS)
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 7b90abc5cf0e..bc9a713c6559 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -444,13 +444,15 @@ static void svc_tcp_kill_temp_xprt(struct svc_xprt *xprt)
  * @data: address of xprt to wake
  * @status: status of handshake
  * @peerid: serial number of key containing the remote peer's identity
+ * @user_session_id: serial number of the userspace session ID
  *
  * If a security policy is specified as an export option, we don't
  * have a specific export here to check. So we set a "TLS session
  * is present" flag on the xprt and let an upper layer enforce local
  * security policy.
  */
-static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid)
+static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid,
+				   key_serial_t user_session_id)
 {
 	struct svc_xprt *xprt = data;
 	struct svc_sock *svsk = container_of(xprt, struct svc_sock, sk_xprt);
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 3aa987e7f072..bce0f43bef65 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2589,9 +2589,11 @@ static int xs_tcp_tls_finish_connecting(struct rpc_xprt *lower_xprt,
  * @data: address of xprt to wake
  * @status: status of handshake
  * @peerid: serial number of key containing the remote's identity
+ * @user_session_id: serial number of the userspace session ID
  *
  */
-static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid)
+static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid,
+				  key_serial_t user_session_id)
 {
 	struct rpc_xprt *lower_xprt = data;
 	struct sock_xprt *lower_transport =
-- 
2.51.0


