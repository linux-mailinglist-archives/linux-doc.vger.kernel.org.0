Return-Path: <linux-doc+bounces-2996-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBF7F6BD2
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 06:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF1122816AD
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 05:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5C93D6C;
	Fri, 24 Nov 2023 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D81D6F;
	Thu, 23 Nov 2023 21:51:35 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=dust.li@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0Vx0Jq84_1700805092;
Received: from localhost(mailfrom:dust.li@linux.alibaba.com fp:SMTPD_---0Vx0Jq84_1700805092)
          by smtp.aliyun-inc.com;
          Fri, 24 Nov 2023 13:51:33 +0800
Date: Fri, 24 Nov 2023 13:51:32 +0800
From: Dust Li <dust.li@linux.alibaba.com>
To: Guangguan Wang <guangguan.wang@linux.alibaba.com>, wenjia@linux.ibm.com,
	jaka@linux.ibm.com, kgraul@linux.ibm.com, corbet@lwn.net,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	edumazet@google.com
Cc: tonylu@linux.alibaba.com, alibuda@linux.alibaba.com,
	guwen@linux.alibaba.com, netdev@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net/smc: add sysctl for max conns per lgr
 for SMC-R v2.1
Message-ID: <20231124055132.GK3323@linux.alibaba.com>
Reply-To: dust.li@linux.alibaba.com
References: <20231122135258.38746-1-guangguan.wang@linux.alibaba.com>
 <20231122135258.38746-3-guangguan.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122135258.38746-3-guangguan.wang@linux.alibaba.com>

On Wed, Nov 22, 2023 at 09:52:58PM +0800, Guangguan Wang wrote:
>Add a new sysctl: net.smc.smcr_max_conns_per_lgr, which is
>used to control the preferred max connections per lgr for
>SMC-R v2.1. The default value of this sysctl is 255, and
>the acceptable value ranges from 16 to 255.
>
>Signed-off-by: Guangguan Wang <guangguan.wang@linux.alibaba.com>

Reviewed-by: Dust Li <dust.li@linux.alibaba.com>

>---
> Documentation/networking/smc-sysctl.rst |  6 ++++++
> include/net/netns/smc.h                 |  1 +
> net/smc/smc_clc.c                       |  5 +++--
> net/smc/smc_sysctl.c                    | 12 ++++++++++++
> net/smc/smc_sysctl.h                    |  1 +
> 5 files changed, 23 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/networking/smc-sysctl.rst b/Documentation/networking/smc-sysctl.rst
>index c6ef86ef4c4f..a874d007f2db 100644
>--- a/Documentation/networking/smc-sysctl.rst
>+++ b/Documentation/networking/smc-sysctl.rst
>@@ -65,3 +65,9 @@ smcr_max_links_per_lgr - INTEGER
> 	for SMC-R v2.1 and later.
> 
> 	Default: 2
>+
>+smcr_max_conns_per_lgr - INTEGER
>+	Controls the max number of connections can be added to a SMC-R link group. The
>+	acceptable value ranges from 16 to 255. Only for SMC-R v2.1 and later.
>+
>+	Default: 255
>diff --git a/include/net/netns/smc.h b/include/net/netns/smc.h
>index da7023587824..fc752a50f91b 100644
>--- a/include/net/netns/smc.h
>+++ b/include/net/netns/smc.h
>@@ -23,5 +23,6 @@ struct netns_smc {
> 	int				sysctl_wmem;
> 	int				sysctl_rmem;
> 	int				sysctl_max_links_per_lgr;
>+	int				sysctl_max_conns_per_lgr;
> };
> #endif
>diff --git a/net/smc/smc_clc.c b/net/smc/smc_clc.c
>index 1f87c8895a27..0fda5156eef0 100644
>--- a/net/smc/smc_clc.c
>+++ b/net/smc/smc_clc.c
>@@ -944,7 +944,7 @@ int smc_clc_send_proposal(struct smc_sock *smc, struct smc_init_info *ini)
> 	}
> 	if (smcr_indicated(ini->smc_type_v2)) {
> 		memcpy(v2_ext->roce, ini->smcrv2.ib_gid_v2, SMC_GID_SIZE);
>-		v2_ext->max_conns = SMC_CONN_PER_LGR_PREFER;
>+		v2_ext->max_conns = net->smc.sysctl_max_conns_per_lgr;
> 		v2_ext->max_links = net->smc.sysctl_max_links_per_lgr;
> 	}
> 
>@@ -1191,7 +1191,8 @@ int smc_clc_srv_v2x_features_validate(struct smc_sock *smc,
> 		return SMC_CLC_DECL_NOV2EXT;
> 
> 	if (ini->smcr_version & SMC_V2) {
>-		ini->max_conns = min_t(u8, pclc_v2_ext->max_conns, SMC_CONN_PER_LGR_PREFER);
>+		ini->max_conns = min_t(u8, pclc_v2_ext->max_conns,
>+				       net->smc.sysctl_max_conns_per_lgr);
> 		if (ini->max_conns < SMC_CONN_PER_LGR_MIN)
> 			return SMC_CLC_DECL_MAXCONNERR;
> 
>diff --git a/net/smc/smc_sysctl.c b/net/smc/smc_sysctl.c
>index 3e9bb921e40a..a5946d1b9d60 100644
>--- a/net/smc/smc_sysctl.c
>+++ b/net/smc/smc_sysctl.c
>@@ -27,6 +27,8 @@ static const int net_smc_wmem_init = (64 * 1024);
> static const int net_smc_rmem_init = (64 * 1024);
> static int links_per_lgr_min = SMC_LINKS_ADD_LNK_MIN;
> static int links_per_lgr_max = SMC_LINKS_ADD_LNK_MAX;
>+static int conns_per_lgr_min = SMC_CONN_PER_LGR_MIN;
>+static int conns_per_lgr_max = SMC_CONN_PER_LGR_MAX;
> 
> static struct ctl_table smc_table[] = {
> 	{
>@@ -79,6 +81,15 @@ static struct ctl_table smc_table[] = {
> 		.extra1		= &links_per_lgr_min,
> 		.extra2		= &links_per_lgr_max,
> 	},
>+	{
>+		.procname	= "smcr_max_conns_per_lgr",
>+		.data		= &init_net.smc.sysctl_max_conns_per_lgr,
>+		.maxlen		= sizeof(int),
>+		.mode		= 0644,
>+		.proc_handler	= proc_dointvec_minmax,
>+		.extra1		= &conns_per_lgr_min,
>+		.extra2		= &conns_per_lgr_max,
>+	},
> 	{  }
> };
> 
>@@ -109,6 +120,7 @@ int __net_init smc_sysctl_net_init(struct net *net)
> 	WRITE_ONCE(net->smc.sysctl_wmem, net_smc_wmem_init);
> 	WRITE_ONCE(net->smc.sysctl_rmem, net_smc_rmem_init);
> 	net->smc.sysctl_max_links_per_lgr = SMC_LINKS_PER_LGR_MAX_PREFER;
>+	net->smc.sysctl_max_conns_per_lgr = SMC_CONN_PER_LGR_PREFER;
> 
> 	return 0;
> 
>diff --git a/net/smc/smc_sysctl.h b/net/smc/smc_sysctl.h
>index 5783dd7575dd..eb2465ae1e15 100644
>--- a/net/smc/smc_sysctl.h
>+++ b/net/smc/smc_sysctl.h
>@@ -24,6 +24,7 @@ static inline int smc_sysctl_net_init(struct net *net)
> {
> 	net->smc.sysctl_autocorking_size = SMC_AUTOCORKING_DEFAULT_SIZE;
> 	net->smc.sysctl_max_links_per_lgr = SMC_LINKS_PER_LGR_MAX_PREFER;
>+	net->smc.sysctl_max_conns_per_lgr = SMC_CONN_PER_LGR_PREFER;
> 	return 0;
> }
> 
>-- 
>2.24.3 (Apple Git-128)

