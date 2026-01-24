Return-Path: <linux-doc+bounces-73865-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGnMLVIldGkl2gAAu9opvQ
	(envelope-from <linux-doc+bounces-73865-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 02:50:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC187C0A4
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 02:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D799D3033893
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 01:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F8822129B;
	Sat, 24 Jan 2026 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL8bufQE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4621771B
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219359; cv=none; b=IVmD16JHaPVSDat/bKT0iCevJmGrP5VPu0+3Cf3DqhDeotY2kOmT0QcrQzJPG6Lv6+zf8uU7QmzYPz0emh1tIXCyOhAOYxOG2yJoJJlXN1/1no4aMYguo4oed+ZdwaBtul0IHbocmKHU23LRzU56F++MPagBJ0EGJ4CG+gAFPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219359; c=relaxed/simple;
	bh=Nb3asoNUaPuKXIaITYKDr5TQ+47i7AoGAnc2tZshDts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWn/VKI8OK2t3KB9CcRM/ML4Ahasj1vm7ljcw86qEJ0nWp9ru0BjtYOn4ASS1T2S2KQLPt/XflH0wsaNkIoRHURWOcstMsC8B2jouFhIGQRpQPmhIyWpdF0XY/zCCMnYmahS774Mvn60OROmQSn1CKmpCcAHTBLtLVac+LyQHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL8bufQE; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b71320f501so6177519eec.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219356; x=1769824156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5leeh6zDjWLKpeuC/+j5CV0yQoA+GAmQ8ZEpaDqT6Y=;
        b=RL8bufQEOBJIYapviFfUitMy/HZvkaNzQ08uZunaJDvqMLnJRf1nyh2iyaXa+xea7O
         kZsB1Rty/vK67czZ+We1bGHpL3voMOiyqFfoYREg0m3MDH566Jx8PY2276YJdzQK+9VI
         du/Iyoiu8l1+XG7aUvpFjh7LW0zxwR2TVO1aZSjBGjhX9V/mRpMz7yMfUtuNck0MwWzU
         yQCHSb3hVnL2HQqOW+QMlggrTcTRmHlN+nqy3EuYP8P7RZOhCiKTAAnZlUR4vXORihQS
         wmHS6pg3Qs3QNUH+kZ2QV9mCmNsuTjLeJ8ZYSoVZLaXaPRO72eRm++RSWHMV3h3MALuo
         /lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219356; x=1769824156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y5leeh6zDjWLKpeuC/+j5CV0yQoA+GAmQ8ZEpaDqT6Y=;
        b=dsRLPc9chy8+xxiePtuEtbvxdmrQhtqAiVE/iISbqE76yTOoBdJ/eabHHrKfLVN9oQ
         LJg+REmt8hjb5zPz8qpgF8nddxSN6iesd3W2VbOIERxewA92X8s//Sz9cqZPkQ8VqRSy
         2NfXMS+uWrw5lpCBXCNDuTycF0OKGDUqYb05/TcrDsrGjFKx6EEJC7t+Lh2feF5dOGjU
         qHcKakyguxuvQRnUjEVe8HwAIRRuT1KMqhWlPeHyPIY0gDdKTgOemjWI60Y4fORZRPzq
         4earngyiqLk+Oqyr7UkBcSuvXyNszPTXkdTIAQUMpap5lKBXw2g/ZSholLMmi4ilH2yW
         OYng==
X-Forwarded-Encrypted: i=1; AJvYcCV3842LZkO60hLnYHPx5i9HarVwUNNDRzHdhqpTW88GZIWbbDaLgwIVZPr+QYElfEOdGVWzEUHDhq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDgk/VXtsXB+R4zFVWf9JaxUg4MALsq4iInbx5wt5a0jOVsGr
	WIALQGWSDWnLqS4UeqBvgEkZP7PkFfxnx8DKyXeduuY181Ilqw4rd6Ik
X-Gm-Gg: AZuq6aIn4iWLXg2Ac1Di6lZLKDlgspNw2CI2lyPnLz2dCbWc6pIPgI1lxyeP0apa4JH
	/WuHnU4j82yW+YQC5w9EOOWA7mjGjb/M91yXbTCirgt2OTeUnkxSG5TUlSP8nZ8u3lPBnB72pz/
	kleduJU68gI2gLIdF9BzMDZhvRChykU3CUic3BklW68ZFZFeE7kUTn2Y5XB9awlhP8rYiALjatH
	52rTmb1XT5gNidZ2pCgLun6nw6seewBiax9aYbaBbzpBJlvYYmNSTmQLGKhyl7KVGs65YCJSMlu
	iY0QPzWx/kgjDtuGN/XlpB54mT4pqDJbt6eZwpv7YE8ECq4ozyhdHRTRWZBIORHHV4glVWDKGE0
	crpVTqAHrXSIa5MKe6RvzQXXfufBp0wzIT26IcbaQRTsLFAfytmeH66X7K0MbnOPkrZ/n+Weg+N
	LW7CVNFdy5MvtUZkupw7EvxccrcxjHdwPQm3Nw8/55L73684aK3DJZqXmQrPoD/f0=
X-Received: by 2002:a05:7301:1016:b0:2b7:2723:c227 with SMTP id 5a478bee46e88-2b739bab766mr3019643eec.31.1769219356181;
        Fri, 23 Jan 2026 17:49:16 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:15 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/16] HID: hid-lenovo-go: Add FPS Mode DPI settings
Date: Sat, 24 Jan 2026 01:48:56 +0000
Message-ID: <20260124014907.991265-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124014907.991265-1-derekjohn.clark@gmail.com>
References: <20260124014907.991265-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-73865-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,lenovo.com,squebb.ca,valvesoftware.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[derekjohnclark@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FC187C0A4
X-Rspamd-Action: no action

Adds attribute that enables selection of the DPI of the optical sensor
when the right handle toggle is set to FPS mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index fe39a2b38f38..5d454cd2cdae 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -64,6 +64,7 @@ struct hid_go_cfg {
 	u32 mcu_version_hardware;
 	u32 mcu_version_product;
 	u32 mcu_version_protocol;
+	u32 mouse_dpi;
 	u8 rgb_en;
 	u8 tp_en;
 	u8 tp_vibration_en;
@@ -217,6 +218,8 @@ static const char *const rumble_mode_text[] = {
 	[RUMBLE_MODE_RPG] = "rpg",
 };
 
+#define FPS_MODE_DPI           0x02
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -424,6 +427,16 @@ static int hid_go_motor_event(struct command_report *cmd_rep)
 	return -EINVAL;
 }
 
+static int hid_go_fps_dpi_event(struct command_report *cmd_rep)
+{
+	if (cmd_rep->sub_cmd != FPS_MODE_DPI)
+		return -EINVAL;
+
+	drvdata.mouse_dpi = get_unaligned_le32(cmd_rep->data);
+
+	return 0;
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -474,8 +487,12 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_MOTOR_CFG:
 			ret = hid_go_motor_event(cmd_rep);
 			break;
+		case GET_DPI_CFG:
+			ret = hid_go_fps_dpi_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
 		case SET_MOTOR_CFG:
+		case SET_DPI_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -1014,6 +1031,52 @@ static ssize_t motor_config_options(struct device *dev,
 	return count;
 }
 
+static ssize_t fps_mode_dpi_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+
+{
+	size_t size = 4;
+	u32 value;
+	u8 val[4];
+	int ret;
+
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value != 500 && value != 800 && value != 1200 && value != 1800)
+		return -EINVAL;
+
+	put_unaligned_le32(value, val);
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, SET_DPI_CFG,
+			       FPS_MODE_DPI, UNSPECIFIED, val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t fps_mode_dpi_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_DPI_CFG,
+			       FPS_MODE_DPI, UNSPECIFIED, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", drvdata.mouse_dpi);
+}
+
+static ssize_t fps_mode_dpi_index_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "500 800 1200 1800\n");
+}
+
 #define LEGO_DEVICE_ATTR_RW(_name, _attrname, _dtype, _rtype, _group)         \
 	static ssize_t _name##_store(struct device *dev,                      \
 				     struct device_attribute *attr,           \
@@ -1085,7 +1148,12 @@ LEGO_DEVICE_ATTR_RW(gamepad_rumble_intensity, "rumble_intensity", UNSPECIFIED,
 static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 			    "rumble_intensity_index");
 
+static DEVICE_ATTR_RW(fps_mode_dpi);
+static DEVICE_ATTR_RO(fps_mode_dpi_index);
+
 static struct attribute *mcu_attrs[] = {
+	&dev_attr_fps_mode_dpi.attr,
+	&dev_attr_fps_mode_dpi_index.attr,
 	&dev_attr_fps_switch_status.attr,
 	&dev_attr_gamepad_mode.attr,
 	&dev_attr_gamepad_mode_index.attr,
-- 
2.52.0


