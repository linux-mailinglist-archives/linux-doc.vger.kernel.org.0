Return-Path: <linux-doc+bounces-2895-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 443557F484E
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 14:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8809B20F49
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFC24E62A;
	Wed, 22 Nov 2023 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51871D61;
	Wed, 22 Nov 2023 05:53:06 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=guangguan.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0Vww0FYC_1700661183;
Received: from localhost.localdomain(mailfrom:guangguan.wang@linux.alibaba.com fp:SMTPD_---0Vww0FYC_1700661183)
          by smtp.aliyun-inc.com;
          Wed, 22 Nov 2023 21:53:03 +0800
From: Guangguan Wang <guangguan.wang@linux.alibaba.com>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	kgraul@linux.ibm.com,
	corbet@lwn.net,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com
Cc: tonylu@linux.alibaba.com,
	alibuda@linux.alibaba.com,
	guwen@linux.alibaba.com,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] net/smc: add sysctl for max links per lgr for SMC-R v2.1
Date: Wed, 22 Nov 2023 21:52:57 +0800
Message-Id: <20231122135258.38746-2-guangguan.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20231122135258.38746-1-guangguan.wang@linux.alibaba.com>
References: <20231122135258.38746-1-guangguan.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new sysctl: net.smc.smcr_max_links_per_lgr, which is
used to control the preferred max links per lgr for SMC-R
v2.1. The default value of this sysctl is 2, and the acceptable
value ranges from 1 to 2.

Signed-off-by: Guangguan Wang <guangguan.wang@linux.alibaba.com>
---
 Documentation/networking/smc-sysctl.rst |  8 ++++++++
 include/net/netns/smc.h                 |  1 +
 net/smc/af_smc.c                        |  2 +-
 net/smc/smc_clc.c                       | 10 +++++++---
 net/smc/smc_clc.h                       |  3 ++-
 net/smc/smc_sysctl.c                    | 12 ++++++++++++
 net/smc/smc_sysctl.h                    |  1 +
 7 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/smc-sysctl.rst b/Documentation/networking/smc-sysctl.rst
index 769149d98773..c6ef86ef4c4f 100644
--- a/Documentation/networking/smc-sysctl.rst
+++ b/Documentation/networking/smc-sysctl.rst
@@ -57,3 +57,11 @@ rmem - INTEGER
 	only allowed 512KiB for SMC-R and 1MiB for SMC-D.
 
 	Default: 64KiB
+
+smcr_max_links_per_lgr - INTEGER
+	Controls the max number of links can be added to a SMC-R link group. Notice that
+	the actual number of the links added to a SMC-R link group depends on the number
+	of RDMA devices exist in the system. The acceptable value ranges from 1 to 2. Only
+	for SMC-R v2.1 and later.
+
+	Default: 2
diff --git a/include/net/netns/smc.h b/include/net/netns/smc.h
index 582212ada3ba..da7023587824 100644
--- a/include/net/netns/smc.h
+++ b/include/net/netns/smc.h
@@ -22,5 +22,6 @@ struct netns_smc {
 	int				sysctl_smcr_testlink_time;
 	int				sysctl_wmem;
 	int				sysctl_rmem;
+	int				sysctl_max_links_per_lgr;
 };
 #endif
diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index da97f946b79b..f8da484efe90 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -2457,7 +2457,7 @@ static void smc_listen_work(struct work_struct *work)
 	if (rc)
 		goto out_decl;
 
-	rc = smc_clc_srv_v2x_features_validate(pclc, ini);
+	rc = smc_clc_srv_v2x_features_validate(new_smc, pclc, ini);
 	if (rc)
 		goto out_decl;
 
diff --git a/net/smc/smc_clc.c b/net/smc/smc_clc.c
index 8deb46c28f1d..1f87c8895a27 100644
--- a/net/smc/smc_clc.c
+++ b/net/smc/smc_clc.c
@@ -824,6 +824,7 @@ int smc_clc_send_proposal(struct smc_sock *smc, struct smc_init_info *ini)
 	struct smc_clc_smcd_gid_chid *gidchids;
 	struct smc_clc_msg_proposal_area *pclc;
 	struct smc_clc_ipv6_prefix *ipv6_prfx;
+	struct net *net = sock_net(&smc->sk);
 	struct smc_clc_v2_extension *v2_ext;
 	struct smc_clc_msg_smcd *pclc_smcd;
 	struct smc_clc_msg_trail *trl;
@@ -944,7 +945,7 @@ int smc_clc_send_proposal(struct smc_sock *smc, struct smc_init_info *ini)
 	if (smcr_indicated(ini->smc_type_v2)) {
 		memcpy(v2_ext->roce, ini->smcrv2.ib_gid_v2, SMC_GID_SIZE);
 		v2_ext->max_conns = SMC_CONN_PER_LGR_PREFER;
-		v2_ext->max_links = SMC_LINKS_PER_LGR_MAX_PREFER;
+		v2_ext->max_links = net->smc.sysctl_max_links_per_lgr;
 	}
 
 	pclc_base->hdr.length = htons(plen);
@@ -1171,10 +1172,12 @@ int smc_clc_send_accept(struct smc_sock *new_smc, bool srv_first_contact,
 	return len > 0 ? 0 : len;
 }
 
-int smc_clc_srv_v2x_features_validate(struct smc_clc_msg_proposal *pclc,
+int smc_clc_srv_v2x_features_validate(struct smc_sock *smc,
+				      struct smc_clc_msg_proposal *pclc,
 				      struct smc_init_info *ini)
 {
 	struct smc_clc_v2_extension *pclc_v2_ext;
+	struct net *net = sock_net(&smc->sk);
 
 	ini->max_conns = SMC_CONN_PER_LGR_MAX;
 	ini->max_links = SMC_LINKS_ADD_LNK_MAX;
@@ -1192,7 +1195,8 @@ int smc_clc_srv_v2x_features_validate(struct smc_clc_msg_proposal *pclc,
 		if (ini->max_conns < SMC_CONN_PER_LGR_MIN)
 			return SMC_CLC_DECL_MAXCONNERR;
 
-		ini->max_links = min_t(u8, pclc_v2_ext->max_links, SMC_LINKS_PER_LGR_MAX_PREFER);
+		ini->max_links = min_t(u8, pclc_v2_ext->max_links,
+				       net->smc.sysctl_max_links_per_lgr);
 		if (ini->max_links < SMC_LINKS_ADD_LNK_MIN)
 			return SMC_CLC_DECL_MAXLINKERR;
 	}
diff --git a/net/smc/smc_clc.h b/net/smc/smc_clc.h
index c5c8e7db775a..89b258cedffe 100644
--- a/net/smc/smc_clc.h
+++ b/net/smc/smc_clc.h
@@ -422,7 +422,8 @@ int smc_clc_send_confirm(struct smc_sock *smc, bool clnt_first_contact,
 			 u8 version, u8 *eid, struct smc_init_info *ini);
 int smc_clc_send_accept(struct smc_sock *smc, bool srv_first_contact,
 			u8 version, u8 *negotiated_eid, struct smc_init_info *ini);
-int smc_clc_srv_v2x_features_validate(struct smc_clc_msg_proposal *pclc,
+int smc_clc_srv_v2x_features_validate(struct smc_sock *smc,
+				      struct smc_clc_msg_proposal *pclc,
 				      struct smc_init_info *ini);
 int smc_clc_clnt_v2x_features_validate(struct smc_clc_first_contact_ext *fce,
 				       struct smc_init_info *ini);
diff --git a/net/smc/smc_sysctl.c b/net/smc/smc_sysctl.c
index 5cbc18c6e62b..3e9bb921e40a 100644
--- a/net/smc/smc_sysctl.c
+++ b/net/smc/smc_sysctl.c
@@ -25,6 +25,8 @@ static int max_sndbuf = INT_MAX / 2;
 static int max_rcvbuf = INT_MAX / 2;
 static const int net_smc_wmem_init = (64 * 1024);
 static const int net_smc_rmem_init = (64 * 1024);
+static int links_per_lgr_min = SMC_LINKS_ADD_LNK_MIN;
+static int links_per_lgr_max = SMC_LINKS_ADD_LNK_MAX;
 
 static struct ctl_table smc_table[] = {
 	{
@@ -68,6 +70,15 @@ static struct ctl_table smc_table[] = {
 		.extra1		= &min_rcvbuf,
 		.extra2		= &max_rcvbuf,
 	},
+	{
+		.procname	= "smcr_max_links_per_lgr",
+		.data		= &init_net.smc.sysctl_max_links_per_lgr,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= &links_per_lgr_min,
+		.extra2		= &links_per_lgr_max,
+	},
 	{  }
 };
 
@@ -97,6 +108,7 @@ int __net_init smc_sysctl_net_init(struct net *net)
 	net->smc.sysctl_smcr_testlink_time = SMC_LLC_TESTLINK_DEFAULT_TIME;
 	WRITE_ONCE(net->smc.sysctl_wmem, net_smc_wmem_init);
 	WRITE_ONCE(net->smc.sysctl_rmem, net_smc_rmem_init);
+	net->smc.sysctl_max_links_per_lgr = SMC_LINKS_PER_LGR_MAX_PREFER;
 
 	return 0;
 
diff --git a/net/smc/smc_sysctl.h b/net/smc/smc_sysctl.h
index 0becc11bd2f4..5783dd7575dd 100644
--- a/net/smc/smc_sysctl.h
+++ b/net/smc/smc_sysctl.h
@@ -23,6 +23,7 @@ void __net_exit smc_sysctl_net_exit(struct net *net);
 static inline int smc_sysctl_net_init(struct net *net)
 {
 	net->smc.sysctl_autocorking_size = SMC_AUTOCORKING_DEFAULT_SIZE;
+	net->smc.sysctl_max_links_per_lgr = SMC_LINKS_PER_LGR_MAX_PREFER;
 	return 0;
 }
 
-- 
2.24.3 (Apple Git-128)


