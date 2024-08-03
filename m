Return-Path: <linux-doc+bounces-22114-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD794680A
	for <lists+linux-doc@lfdr.de>; Sat,  3 Aug 2024 08:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91732822F2
	for <lists+linux-doc@lfdr.de>; Sat,  3 Aug 2024 06:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E0714D44E;
	Sat,  3 Aug 2024 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="KoRIaBg1"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90523282FC;
	Sat,  3 Aug 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665873; cv=none; b=uIM79UrxweyoMQH1x9TUT8ys848jAiZ0f+mOPu4DJik9IfurFvbZ5ruOvmD5pAvvY/m0MxNR2ZDpuyaPo1LFUgLlyBUEC3mIGLlS+U8AutxO9uuCYTCwmUDLFKnzGzusJ3jeDsLKtTIIgNIU21a8+H3tRBos+uOilsAFfKp3+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665873; c=relaxed/simple;
	bh=3ISrAiKNM8k6iU4ZAlF8KOJi0J99GqavReM2lu4LOis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pye+ginzVOrwy8AFFmtvqxYJIbrMjURE93x/8g09sxkJWsN9T0xSJtZjOqjf48vF5T1jZe17wzM2vSnJKpCKZZdU4u9SNI3o+hPcDnc6D/kR3oVXYeR6i3nH1hm4ZQ50h2D1BqFlftQFoi4tJs/LE6kZYdz+HRBcYxAPagplvhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=KoRIaBg1; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1052)
	id 2BF6B20B712E; Fri,  2 Aug 2024 23:08:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2BF6B20B712E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722665320;
	bh=aL3J7Fd9pnj+zV5ArkTpYhWqjNIJEWGkj17s2dmTw6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoRIaBg1uuk2dCiLm3cHMlcB/PbxG2RQytcCKDCYWQ57bsrmESmsv592fJsv/DAbY
	 vymFgF2gYgAX8Wr4s7HM+jpO7150g0Ehs4g8pphLVg8t+niB2UC/UWROQqszP7DuON
	 8fqEeFR3G5K0Kr3M9Pfi6rskcnTaSvY4VzL6NoKo=
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net,
	zohar@linux.ibm.com,
	jmorris@namei.org,
	serge@hallyn.com,
	tytso@mit.edu,
	ebiggers@kernel.org,
	axboe@kernel.dk,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	eparis@redhat.com,
	paul@paul-moore.com
Cc: linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	fsverity@lists.linux.dev,
	linux-block@vger.kernel.org,
	dm-devel@lists.linux.dev,
	audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deven Bowers <deven.desai@linux.microsoft.com>,
	Fan Wu <wufan@linux.microsoft.com>
Subject: [PATCH v20 02/20] ipe: add policy parser
Date: Fri,  2 Aug 2024 23:08:16 -0700
Message-Id: <1722665314-21156-3-git-send-email-wufan@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Deven Bowers <deven.desai@linux.microsoft.com>

IPE's interpretation of the what the user trusts is accomplished through
its policy. IPE's design is to not provide support for a single trust
provider, but to support multiple providers to enable the end-user to
choose the best one to seek their needs.

This requires the policy to be rather flexible and modular so that
integrity providers, like fs-verity, dm-verity, or some other system,
can plug into the policy with minimal code changes.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

---
v2:
  + Split evaluation loop, access control hooks,
    and evaluation loop from policy parser and userspace
    interface to pass mailing list character limit

v3:
  + Move policy load and activation audit event to 03/12
  + Fix a potential panic when a policy failed to load.
  + use pr_warn for a failure to parse instead of an
    audit record
  + Remove comments from headers
  + Add lockdep assertions to ipe_update_active_policy and
    ipe_activate_policy
  + Fix up warnings with checkpatch --strict
  + Use file_ns_capable for CAP_MAC_ADMIN for securityfs
    nodes.
  + Use memdup_user instead of kzalloc+simple_write_to_buffer.
  + Remove strict_parse command line parameter, as it is added
    by the sysctl command line.
  + Prefix extern variables with ipe_

v4:
  + Remove securityfs to reverse-dependency
  + Add SHA1 reverse dependency.
  + Add versioning scheme for IPE properties, and associated
    interface to query the versioning scheme.
  + Cause a parser to always return an error on unknown syntax.
  + Remove strict_parse option
  + Change active_policy interface from sysctl, to securityfs,
    and change scheme.

v5:
  + Cause an error if a default action is not defined for each
    operation.
  + Minor function renames

v6:
  + No changes

v7:
  + Further split parser and userspace interface into two
    separate commits, for easier review.
  + Refactor policy parser to make code cleaner via introducing a
    more modular design, for easier extension of policy, and
    easier review.

v8:
  + remove unnecessary pr_info emission on parser loading
  + add explicit newline to the pr_err emitted when a parser
    fails to load.

v9:
  + switch to match table to parse policy
  + remove quote syntax and KERNEL_READ operation

v10:
  + Fix memory leaks in parser
  + Fix typos and change code styles

v11:
  + Fix code style issues

v12:
  + Add __always_unused to an unused parameter
  + Simplify error case handling

v13:
  + No changes

v14:
  + No changes

v15:
  + No changes

v16:
  + No changes

v17:
  + Add years to license header
  + Fix code and documentation style issues

v18:
  + No changes

v19:
  + No changes

v20:
  + No changes
---
 security/ipe/Makefile        |   2 +
 security/ipe/policy.c        | 103 ++++++++
 security/ipe/policy.h        |  83 ++++++
 security/ipe/policy_parser.c | 495 +++++++++++++++++++++++++++++++++++
 security/ipe/policy_parser.h |  11 +
 5 files changed, 694 insertions(+)
 create mode 100644 security/ipe/policy.c
 create mode 100644 security/ipe/policy.h
 create mode 100644 security/ipe/policy_parser.c
 create mode 100644 security/ipe/policy_parser.h

diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 5486398a69e9..3093de1afd3e 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -7,3 +7,5 @@
 
 obj-$(CONFIG_SECURITY_IPE) += \
 	ipe.o \
+	policy.o \
+	policy_parser.o \
diff --git a/security/ipe/policy.c b/security/ipe/policy.c
new file mode 100644
index 000000000000..dd7b5b79903a
--- /dev/null
+++ b/security/ipe/policy.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/verification.h>
+
+#include "ipe.h"
+#include "policy.h"
+#include "policy_parser.h"
+
+/**
+ * ipe_free_policy() - Deallocate a given IPE policy.
+ * @p: Supplies the policy to free.
+ *
+ * Safe to call on IS_ERR/NULL.
+ */
+void ipe_free_policy(struct ipe_policy *p)
+{
+	if (IS_ERR_OR_NULL(p))
+		return;
+
+	ipe_free_parsed_policy(p->parsed);
+	/*
+	 * p->text is allocated only when p->pkcs7 is not NULL
+	 * otherwise it points to the plaintext data inside the pkcs7
+	 */
+	if (!p->pkcs7)
+		kfree(p->text);
+	kfree(p->pkcs7);
+	kfree(p);
+}
+
+static int set_pkcs7_data(void *ctx, const void *data, size_t len,
+			  size_t asn1hdrlen __always_unused)
+{
+	struct ipe_policy *p = ctx;
+
+	p->text = (const char *)data;
+	p->textlen = len;
+
+	return 0;
+}
+
+/**
+ * ipe_new_policy() - Allocate and parse an ipe_policy structure.
+ *
+ * @text: Supplies a pointer to the plain-text policy to parse.
+ * @textlen: Supplies the length of @text.
+ * @pkcs7: Supplies a pointer to a pkcs7-signed IPE policy.
+ * @pkcs7len: Supplies the length of @pkcs7.
+ *
+ * @text/@textlen Should be NULL/0 if @pkcs7/@pkcs7len is set.
+ *
+ * Return:
+ * * a pointer to the ipe_policy structure	- Success
+ * * %-EBADMSG					- Policy is invalid
+ * * %-ENOMEM					- Out of memory (OOM)
+ * * %-ERANGE					- Policy version number overflow
+ * * %-EINVAL					- Policy version parsing error
+ */
+struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
+				  const char *pkcs7, size_t pkcs7len)
+{
+	struct ipe_policy *new = NULL;
+	int rc = 0;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	if (!text) {
+		new->pkcs7len = pkcs7len;
+		new->pkcs7 = kmemdup(pkcs7, pkcs7len, GFP_KERNEL);
+		if (!new->pkcs7) {
+			rc = -ENOMEM;
+			goto err;
+		}
+
+		rc = verify_pkcs7_signature(NULL, 0, new->pkcs7, pkcs7len, NULL,
+					    VERIFYING_UNSPECIFIED_SIGNATURE,
+					    set_pkcs7_data, new);
+		if (rc)
+			goto err;
+	} else {
+		new->textlen = textlen;
+		new->text = kstrdup(text, GFP_KERNEL);
+		if (!new->text) {
+			rc = -ENOMEM;
+			goto err;
+		}
+	}
+
+	rc = ipe_parse_policy(new);
+	if (rc)
+		goto err;
+
+	return new;
+err:
+	ipe_free_policy(new);
+	return ERR_PTR(rc);
+}
diff --git a/security/ipe/policy.h b/security/ipe/policy.h
new file mode 100644
index 000000000000..8292ffaaff12
--- /dev/null
+++ b/security/ipe/policy.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+#ifndef _IPE_POLICY_H
+#define _IPE_POLICY_H
+
+#include <linux/list.h>
+#include <linux/types.h>
+
+enum ipe_op_type {
+	IPE_OP_EXEC = 0,
+	IPE_OP_FIRMWARE,
+	IPE_OP_KERNEL_MODULE,
+	IPE_OP_KEXEC_IMAGE,
+	IPE_OP_KEXEC_INITRAMFS,
+	IPE_OP_POLICY,
+	IPE_OP_X509,
+	__IPE_OP_MAX,
+};
+
+#define IPE_OP_INVALID __IPE_OP_MAX
+
+enum ipe_action_type {
+	IPE_ACTION_ALLOW = 0,
+	IPE_ACTION_DENY,
+	__IPE_ACTION_MAX
+};
+
+#define IPE_ACTION_INVALID __IPE_ACTION_MAX
+
+enum ipe_prop_type {
+	__IPE_PROP_MAX
+};
+
+#define IPE_PROP_INVALID __IPE_PROP_MAX
+
+struct ipe_prop {
+	struct list_head next;
+	enum ipe_prop_type type;
+	void *value;
+};
+
+struct ipe_rule {
+	enum ipe_op_type op;
+	enum ipe_action_type action;
+	struct list_head props;
+	struct list_head next;
+};
+
+struct ipe_op_table {
+	struct list_head rules;
+	enum ipe_action_type default_action;
+};
+
+struct ipe_parsed_policy {
+	const char *name;
+	struct {
+		u16 major;
+		u16 minor;
+		u16 rev;
+	} version;
+
+	enum ipe_action_type global_default_action;
+
+	struct ipe_op_table rules[__IPE_OP_MAX];
+};
+
+struct ipe_policy {
+	const char *pkcs7;
+	size_t pkcs7len;
+
+	const char *text;
+	size_t textlen;
+
+	struct ipe_parsed_policy *parsed;
+};
+
+struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
+				  const char *pkcs7, size_t pkcs7len);
+void ipe_free_policy(struct ipe_policy *pol);
+
+#endif /* _IPE_POLICY_H */
diff --git a/security/ipe/policy_parser.c b/security/ipe/policy_parser.c
new file mode 100644
index 000000000000..32064262348a
--- /dev/null
+++ b/security/ipe/policy_parser.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/parser.h>
+#include <linux/types.h>
+#include <linux/ctype.h>
+
+#include "policy.h"
+#include "policy_parser.h"
+
+#define START_COMMENT	'#'
+#define IPE_POLICY_DELIM " \t"
+#define IPE_LINE_DELIM "\n\r"
+
+/**
+ * new_parsed_policy() - Allocate and initialize a parsed policy.
+ *
+ * Return:
+ * * a pointer to the ipe_parsed_policy structure	- Success
+ * * %-ENOMEM						- Out of memory (OOM)
+ */
+static struct ipe_parsed_policy *new_parsed_policy(void)
+{
+	struct ipe_parsed_policy *p = NULL;
+	struct ipe_op_table *t = NULL;
+	size_t i = 0;
+
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+
+	p->global_default_action = IPE_ACTION_INVALID;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
+		t = &p->rules[i];
+
+		t->default_action = IPE_ACTION_INVALID;
+		INIT_LIST_HEAD(&t->rules);
+	}
+
+	return p;
+}
+
+/**
+ * remove_comment() - Truncate all chars following START_COMMENT in a string.
+ *
+ * @line: Supplies a policy line string for preprocessing.
+ */
+static void remove_comment(char *line)
+{
+	line = strchr(line, START_COMMENT);
+
+	if (line)
+		*line = '\0';
+}
+
+/**
+ * remove_trailing_spaces() - Truncate all trailing spaces in a string.
+ *
+ * @line: Supplies a policy line string for preprocessing.
+ *
+ * Return: The length of truncated string.
+ */
+static size_t remove_trailing_spaces(char *line)
+{
+	size_t i = 0;
+
+	i = strlen(line);
+	while (i > 0 && isspace(line[i - 1]))
+		i--;
+
+	line[i] = '\0';
+
+	return i;
+}
+
+/**
+ * parse_version() - Parse policy version.
+ * @ver: Supplies a version string to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EBADMSG	- Version string is invalid
+ * * %-ERANGE	- Version number overflow
+ * * %-EINVAL	- Parsing error
+ */
+static int parse_version(char *ver, struct ipe_parsed_policy *p)
+{
+	u16 *const cv[] = { &p->version.major, &p->version.minor, &p->version.rev };
+	size_t sep_count = 0;
+	char *token;
+	int rc = 0;
+
+	while ((token = strsep(&ver, ".")) != NULL) {
+		/* prevent overflow */
+		if (sep_count >= ARRAY_SIZE(cv))
+			return -EBADMSG;
+
+		rc = kstrtou16(token, 10, cv[sep_count]);
+		if (rc)
+			return rc;
+
+		++sep_count;
+	}
+
+	/* prevent underflow */
+	if (sep_count != ARRAY_SIZE(cv))
+		return -EBADMSG;
+
+	return 0;
+}
+
+enum header_opt {
+	IPE_HEADER_POLICY_NAME = 0,
+	IPE_HEADER_POLICY_VERSION,
+	__IPE_HEADER_MAX
+};
+
+static const match_table_t header_tokens = {
+	{IPE_HEADER_POLICY_NAME,	"policy_name=%s"},
+	{IPE_HEADER_POLICY_VERSION,	"policy_version=%s"},
+	{__IPE_HEADER_MAX,		NULL}
+};
+
+/**
+ * parse_header() - Parse policy header information.
+ * @line: Supplies header line to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EBADMSG	- Header string is invalid
+ * * %-ENOMEM	- Out of memory (OOM)
+ * * %-ERANGE	- Version number overflow
+ * * %-EINVAL	- Version parsing error
+ */
+static int parse_header(char *line, struct ipe_parsed_policy *p)
+{
+	substring_t args[MAX_OPT_ARGS];
+	char *t, *ver = NULL;
+	size_t idx = 0;
+	int rc = 0;
+
+	while ((t = strsep(&line, IPE_POLICY_DELIM)) != NULL) {
+		int token;
+
+		if (*t == '\0')
+			continue;
+		if (idx >= __IPE_HEADER_MAX) {
+			rc = -EBADMSG;
+			goto out;
+		}
+
+		token = match_token(t, header_tokens, args);
+		if (token != idx) {
+			rc = -EBADMSG;
+			goto out;
+		}
+
+		switch (token) {
+		case IPE_HEADER_POLICY_NAME:
+			p->name = match_strdup(&args[0]);
+			if (!p->name)
+				rc = -ENOMEM;
+			break;
+		case IPE_HEADER_POLICY_VERSION:
+			ver = match_strdup(&args[0]);
+			if (!ver) {
+				rc = -ENOMEM;
+				break;
+			}
+			rc = parse_version(ver, p);
+			break;
+		default:
+			rc = -EBADMSG;
+		}
+		if (rc)
+			goto out;
+		++idx;
+	}
+
+	if (idx != __IPE_HEADER_MAX)
+		rc = -EBADMSG;
+
+out:
+	kfree(ver);
+	return rc;
+}
+
+/**
+ * token_default() - Determine if the given token is "DEFAULT".
+ * @token: Supplies the token string to be compared.
+ *
+ * Return:
+ * * %false	- The token is not "DEFAULT"
+ * * %true	- The token is "DEFAULT"
+ */
+static bool token_default(char *token)
+{
+	return !strcmp(token, "DEFAULT");
+}
+
+/**
+ * free_rule() - Free the supplied ipe_rule struct.
+ * @r: Supplies the ipe_rule struct to be freed.
+ *
+ * Free a ipe_rule struct @r. Note @r must be removed from any lists before
+ * calling this function.
+ */
+static void free_rule(struct ipe_rule *r)
+{
+	struct ipe_prop *p, *t;
+
+	if (IS_ERR_OR_NULL(r))
+		return;
+
+	list_for_each_entry_safe(p, t, &r->props, next) {
+		list_del(&p->next);
+		kfree(p);
+	}
+
+	kfree(r);
+}
+
+static const match_table_t operation_tokens = {
+	{IPE_OP_EXEC,			"op=EXECUTE"},
+	{IPE_OP_FIRMWARE,		"op=FIRMWARE"},
+	{IPE_OP_KERNEL_MODULE,		"op=KMODULE"},
+	{IPE_OP_KEXEC_IMAGE,		"op=KEXEC_IMAGE"},
+	{IPE_OP_KEXEC_INITRAMFS,	"op=KEXEC_INITRAMFS"},
+	{IPE_OP_POLICY,			"op=POLICY"},
+	{IPE_OP_X509,			"op=X509_CERT"},
+	{IPE_OP_INVALID,		NULL}
+};
+
+/**
+ * parse_operation() - Parse the operation type given a token string.
+ * @t: Supplies the token string to be parsed.
+ *
+ * Return: The parsed operation type.
+ */
+static enum ipe_op_type parse_operation(char *t)
+{
+	substring_t args[MAX_OPT_ARGS];
+
+	return match_token(t, operation_tokens, args);
+}
+
+static const match_table_t action_tokens = {
+	{IPE_ACTION_ALLOW,	"action=ALLOW"},
+	{IPE_ACTION_DENY,	"action=DENY"},
+	{IPE_ACTION_INVALID,	NULL}
+};
+
+/**
+ * parse_action() - Parse the action type given a token string.
+ * @t: Supplies the token string to be parsed.
+ *
+ * Return: The parsed action type.
+ */
+static enum ipe_action_type parse_action(char *t)
+{
+	substring_t args[MAX_OPT_ARGS];
+
+	return match_token(t, action_tokens, args);
+}
+
+/**
+ * parse_property() - Parse a rule property given a token string.
+ * @t: Supplies the token string to be parsed.
+ * @r: Supplies the ipe_rule the parsed property will be associated with.
+ *
+ * This is a placeholder. The actual function will be introduced in the
+ * latter commits.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-ENOMEM	- Out of memory (OOM)
+ * * %-EBADMSG	- The supplied token cannot be parsed
+ */
+static int parse_property(char *t, struct ipe_rule *r)
+{
+	return -EBADMSG;
+}
+
+/**
+ * parse_rule() - parse a policy rule line.
+ * @line: Supplies rule line to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * 0		- Success
+ * * %-ENOMEM	- Out of memory (OOM)
+ * * %-EBADMSG	- Policy syntax error
+ */
+static int parse_rule(char *line, struct ipe_parsed_policy *p)
+{
+	enum ipe_action_type action = IPE_ACTION_INVALID;
+	enum ipe_op_type op = IPE_OP_INVALID;
+	bool is_default_rule = false;
+	struct ipe_rule *r = NULL;
+	bool first_token = true;
+	bool op_parsed = false;
+	int rc = 0;
+	char *t;
+
+	r = kzalloc(sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&r->next);
+	INIT_LIST_HEAD(&r->props);
+
+	while (t = strsep(&line, IPE_POLICY_DELIM), line) {
+		if (*t == '\0')
+			continue;
+		if (first_token && token_default(t)) {
+			is_default_rule = true;
+		} else {
+			if (!op_parsed) {
+				op = parse_operation(t);
+				if (op == IPE_OP_INVALID)
+					rc = -EBADMSG;
+				else
+					op_parsed = true;
+			} else {
+				rc = parse_property(t, r);
+			}
+		}
+
+		if (rc)
+			goto err;
+		first_token = false;
+	}
+
+	action = parse_action(t);
+	if (action == IPE_ACTION_INVALID) {
+		rc = -EBADMSG;
+		goto err;
+	}
+
+	if (is_default_rule) {
+		if (!list_empty(&r->props)) {
+			rc = -EBADMSG;
+		} else if (op == IPE_OP_INVALID) {
+			if (p->global_default_action != IPE_ACTION_INVALID)
+				rc = -EBADMSG;
+			else
+				p->global_default_action = action;
+		} else {
+			if (p->rules[op].default_action != IPE_ACTION_INVALID)
+				rc = -EBADMSG;
+			else
+				p->rules[op].default_action = action;
+		}
+	} else if (op != IPE_OP_INVALID && action != IPE_ACTION_INVALID) {
+		r->op = op;
+		r->action = action;
+	} else {
+		rc = -EBADMSG;
+	}
+
+	if (rc)
+		goto err;
+	if (!is_default_rule)
+		list_add_tail(&r->next, &p->rules[op].rules);
+	else
+		free_rule(r);
+
+	return rc;
+err:
+	free_rule(r);
+	return rc;
+}
+
+/**
+ * ipe_free_parsed_policy() - free a parsed policy structure.
+ * @p: Supplies the parsed policy.
+ */
+void ipe_free_parsed_policy(struct ipe_parsed_policy *p)
+{
+	struct ipe_rule *pp, *t;
+	size_t i = 0;
+
+	if (IS_ERR_OR_NULL(p))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i)
+		list_for_each_entry_safe(pp, t, &p->rules[i].rules, next) {
+			list_del(&pp->next);
+			free_rule(pp);
+		}
+
+	kfree(p->name);
+	kfree(p);
+}
+
+/**
+ * validate_policy() - validate a parsed policy.
+ * @p: Supplies the fully parsed policy.
+ *
+ * Given a policy structure that was just parsed, validate that all
+ * operations have their default rules or a global default rule is set.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EBADMSG	- Policy is invalid
+ */
+static int validate_policy(const struct ipe_parsed_policy *p)
+{
+	size_t i = 0;
+
+	if (p->global_default_action != IPE_ACTION_INVALID)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
+		if (p->rules[i].default_action == IPE_ACTION_INVALID)
+			return -EBADMSG;
+	}
+
+	return 0;
+}
+
+/**
+ * ipe_parse_policy() - Given a string, parse the string into an IPE policy.
+ * @p: partially filled ipe_policy structure to populate with the result.
+ *     it must have text and textlen set.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EBADMSG	- Policy is invalid
+ * * %-ENOMEM	- Out of Memory
+ * * %-ERANGE	- Policy version number overflow
+ * * %-EINVAL	- Policy version parsing error
+ */
+int ipe_parse_policy(struct ipe_policy *p)
+{
+	struct ipe_parsed_policy *pp = NULL;
+	char *policy = NULL, *dup = NULL;
+	bool header_parsed = false;
+	char *line = NULL;
+	size_t len;
+	int rc = 0;
+
+	if (!p->textlen)
+		return -EBADMSG;
+
+	policy = kmemdup_nul(p->text, p->textlen, GFP_KERNEL);
+	if (!policy)
+		return -ENOMEM;
+	dup = policy;
+
+	pp = new_parsed_policy();
+	if (IS_ERR(pp)) {
+		rc = PTR_ERR(pp);
+		goto out;
+	}
+
+	while ((line = strsep(&policy, IPE_LINE_DELIM)) != NULL) {
+		remove_comment(line);
+		len = remove_trailing_spaces(line);
+		if (!len)
+			continue;
+
+		if (!header_parsed) {
+			rc = parse_header(line, pp);
+			if (rc)
+				goto err;
+			header_parsed = true;
+		} else {
+			rc = parse_rule(line, pp);
+			if (rc)
+				goto err;
+		}
+	}
+
+	if (!header_parsed || validate_policy(pp)) {
+		rc = -EBADMSG;
+		goto err;
+	}
+
+	p->parsed = pp;
+
+out:
+	kfree(dup);
+	return rc;
+err:
+	ipe_free_parsed_policy(pp);
+	goto out;
+}
diff --git a/security/ipe/policy_parser.h b/security/ipe/policy_parser.h
new file mode 100644
index 000000000000..62b6209019a2
--- /dev/null
+++ b/security/ipe/policy_parser.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+#ifndef _IPE_POLICY_PARSER_H
+#define _IPE_POLICY_PARSER_H
+
+int ipe_parse_policy(struct ipe_policy *p);
+void ipe_free_parsed_policy(struct ipe_parsed_policy *p);
+
+#endif /* _IPE_POLICY_PARSER_H */
-- 
2.44.0


