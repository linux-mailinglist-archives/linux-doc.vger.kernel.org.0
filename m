Return-Path: <linux-doc+bounces-92233-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z05OOwWMLGqvSQQAu9opvQ
	(envelope-from <linux-doc+bounces-92233-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0967CDC4
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=ubN8dCLv;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92233-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92233-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C062A3533D9F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 22:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827B73F8EBE;
	Fri, 12 Jun 2026 22:40:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E973DDDAE;
	Fri, 12 Jun 2026 22:40:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304006; cv=none; b=nf8mVcdYN8EgyZRNgU4ULyE1G63qjs69g0ypArPHoj+da7iwlTJn1JBy3Uj/wdffQyfrgjWC2Cv6OqYkmKPQabEYp0V5YkXAPjepBWqY+lQDrFYPrScO1vR473YmaBNkrHTekhwPmjy0g1o0GXr5MokJvLDsUdyccgk43CHf2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304006; c=relaxed/simple;
	bh=bDitOSq5AHIZBCroRnMHjGAoaQrisRFnimOScaPMkdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EI9fk9vtbrjJp19Gm45kYcyBq/cTbuRN2yTZd0DZrmhjBxyHQp4M1pV+mel+v27Jk189XIz+N/RAQUVBLzzu2lw7wlpPimu9gwq3UK2AyAj+E3H3Hkopeox/M3qTMwKXFeO155sP1hB/Y9uGneJKLYX9luNm5uhkhcQCn24HDtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ubN8dCLv; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A6854A09;
	Fri, 12 Jun 2026 15:39:59 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 598E13FB7F;
	Fri, 12 Jun 2026 15:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304004; bh=bDitOSq5AHIZBCroRnMHjGAoaQrisRFnimOScaPMkdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ubN8dCLvxlrzvXzNQRtLRVsZnQaiqqLootZMFcbfixqazcLglcuQI4g7a4upUJ15b
	 B/ae8O/EBrnm7Fcg+OyVybDGGJ80s7GGxkggFlX9F5L+kGkmMZ4PBGk411Ecsg/vfd
	 K1DMoHqfhVlLPVACiSkRX91CF3OR+zbpmIlMo690=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 21/31] firmware: arm_scmi: stlmfs: Add basic mount options
Date: Fri, 12 Jun 2026 23:37:51 +0100
Message-ID: <20260612223802.1337232-22-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com];
	TAGGED_FROM(0.00)[bounces-92233-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:cristian.marussi@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70E0967CDC4

Add mount options to choose different uid/gid/umask for all the created
files; reject handling changes to these options while remounting.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_system_telemetry.c | 146 +++++++++++++++++-
 1 file changed, 143 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
index 567585dfb036..f4d284335ac0 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -34,6 +34,32 @@
 #define MAX_AVAILABLE_INTERV_CHAR_LENGTH	25
 #define MAX_BULK_LINE_CHAR_LENGTH		64
 
+enum {
+	Opt_uid,
+	Opt_gid,
+	Opt_umask,
+};
+
+static const struct fs_parameter_spec stlmfs_param_spec[] = {
+	fsparam_uid("uid", Opt_uid),
+	fsparam_gid("gid", Opt_gid),
+	fsparam_u32oct("umask", Opt_umask),
+	{}
+};
+
+struct stlmfs_fs_context {
+	unsigned int opts;
+	kuid_t uid;
+	kgid_t gid;
+	umode_t umask;
+};
+
+struct stlmfs_sb_info {
+	kuid_t uid;
+	kgid_t gid;
+	umode_t umask;
+};
+
 static struct kmem_cache *stlmfs_inode_cachep;
 
 static DEFINE_MUTEX(stlmfs_mtx);
@@ -202,10 +228,12 @@ static struct inode *stlmfs_get_inode(struct super_block *sb, umode_t mode)
 	struct inode *inode = new_inode(sb);
 
 	if (inode) {
+		struct stlmfs_sb_info *sbi = sb->s_fs_info;
+
 		inode->i_ino = get_next_ino();
-		inode->i_uid = GLOBAL_ROOT_UID;
-		inode->i_gid = GLOBAL_ROOT_GID;
-		inode->i_mode = mode & ~SCMI_TLM_DEFAULT_UMASK;
+		inode->i_uid = sbi->uid;
+		inode->i_gid = sbi->gid;
+		inode->i_mode = mode & ~sbi->umask;
 		simple_inode_init_ts(inode);
 	}
 
@@ -1282,10 +1310,25 @@ static void stlmfs_free_inode(struct inode *inode)
 	kmem_cache_free(stlmfs_inode_cachep, tlmi);
 }
 
+static int stlmfs_show_options(struct seq_file *seq, struct dentry *root)
+{
+	struct stlmfs_sb_info *sbi = root->d_sb->s_fs_info;
+
+	if (!uid_eq(sbi->uid, GLOBAL_ROOT_UID))
+		seq_printf(seq, ",uid=%u", from_kuid_munged(&init_user_ns, sbi->uid));
+	if (!gid_eq(sbi->gid, GLOBAL_ROOT_GID))
+		seq_printf(seq, ",gid=%u", from_kgid_munged(&init_user_ns, sbi->gid));
+	if (sbi->umask != SCMI_TLM_DEFAULT_UMASK)
+		seq_printf(seq, ",umask=%04u", sbi->umask);
+
+	return 0;
+}
+
 static const struct super_operations tlm_sops = {
 	.statfs = simple_statfs,
 	.alloc_inode = stlmfs_alloc_inode,
 	.free_inode = stlmfs_free_inode,
+	.show_options = stlmfs_show_options,
 };
 
 static struct dentry *stlmfs_create_root_dentry(struct super_block *sb)
@@ -1366,10 +1409,26 @@ static int scmi_telemetry_instance_register(struct super_block *sb,
 
 static int stlmfs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
+	struct stlmfs_fs_context *ctx;
 	struct scmi_tlm_instance *ti;
 	struct dentry *root_dentry;
 	int ret;
 
+	/* Bail out if already initialized */
+	if (sb->s_fs_info)
+		return 0;
+
+	struct stlmfs_sb_info *sbi __free(kfree) =
+		kzalloc(sizeof(*sbi), GFP_KERNEL);
+	if (!sbi)
+		return -ENOMEM;
+
+	ctx = fc->fs_private;
+	sbi->uid = ctx->uid;
+	sbi->gid = ctx->gid;
+	sbi->umask = ctx->umask;
+
+	sb->s_fs_info = sbi;
 	sb->s_magic = TLM_FS_MAGIC;
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
@@ -1379,6 +1438,7 @@ static int stlmfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (IS_ERR(root_dentry))
 		return PTR_ERR(root_dentry);
 
+	retain_and_null_ptr(sbi);
 	sb->s_root = root_dentry;
 
 	mutex_lock(&stlmfs_mtx);
@@ -1396,17 +1456,93 @@ static int stlmfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	return 0;
 }
 
+static void stlmfs_free(struct fs_context *fc)
+{
+	struct stlmfs_fs_context *ctx;
+
+	ctx = fc->fs_private;
+
+	kfree(ctx);
+}
+
 static int stlmfs_get_tree(struct fs_context *fc)
 {
 	return get_tree_single(fc, stlmfs_fill_super);
 }
 
+static int stlmfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
+{
+	struct stlmfs_fs_context *ctx;
+	struct fs_parse_result result;
+	int opt;
+
+	opt = fs_parse(fc, stlmfs_param_spec, param, &result);
+	if (opt < 0)
+		return opt;
+
+	ctx = fc->fs_private;
+
+	switch (opt) {
+	case Opt_uid:
+		if (!kuid_has_mapping(fc->user_ns, result.uid))
+			return invalfc(fc, "Invalid uid");
+		ctx->uid = result.uid;
+		ctx->opts |= BIT(Opt_uid);
+		break;
+	case Opt_gid:
+		if (!kgid_has_mapping(fc->user_ns, result.gid))
+			return invalfc(fc, "Invalid gid");
+		ctx->gid = result.gid;
+		ctx->opts |= BIT(Opt_gid);
+		break;
+	case Opt_umask:
+		ctx->umask = result.uint_32 & 07777;
+		ctx->opts |= BIT(Opt_umask);
+		break;
+	default:
+		return -ENOPARAM;
+	}
+
+	return 0;
+}
+
+static int stlmfs_reconfigure(struct fs_context *fc)
+{
+	struct stlmfs_fs_context *ctx = fc->fs_private;
+
+	sync_filesystem(fc->root->d_sb);
+
+	if (ctx->opts & BIT(Opt_uid))
+		return invalfc(fc, "uid cannot be changed on remount");
+	if (ctx->opts & BIT(Opt_gid))
+		return invalfc(fc, "gid cannot be changed on remount");
+	if (ctx->opts & BIT(Opt_umask))
+		return invalfc(fc, "umask cannot be changed on remount");
+
+	return 0;
+}
+
 static const struct fs_context_operations stlmfs_fc_ops = {
 	.get_tree = stlmfs_get_tree,
+	.parse_param = stlmfs_parse_param,
+	.free = stlmfs_free,
+	.reconfigure = stlmfs_reconfigure,
 };
 
 static int stlmfs_init_fs_context(struct fs_context *fc)
 {
+	struct stlmfs_fs_context *ctx;
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return -ENOMEM;
+
+	/* defaults */
+	ctx->uid = GLOBAL_ROOT_UID;
+	ctx->gid = GLOBAL_ROOT_GID;
+	ctx->umask = SCMI_TLM_DEFAULT_UMASK;
+
+	fc->fs_private = ctx;
 	fc->ops = &stlmfs_fc_ops;
 
 	return 0;
@@ -1414,11 +1550,15 @@ static int stlmfs_init_fs_context(struct fs_context *fc)
 
 static void stlmfs_kill_sb(struct super_block *sb)
 {
+	struct stlmfs_sb_info *sbi = sb->s_fs_info;
+
 	mutex_lock(&stlmfs_mtx);
 	stlmfs_sb = NULL;
 	mutex_unlock(&stlmfs_mtx);
 
 	kill_anon_super(sb);
+
+	kfree(sbi);
 }
 
 static struct file_system_type scmi_telemetry_fs = {
-- 
2.54.0


