Return-Path: <linux-doc+bounces-80480-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIAuFVCcvmkcUQMAu9opvQ
	(envelope-from <linux-doc+bounces-80480-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 14:25:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA02E5831
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 14:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19183008A47
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 13:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6224531717D;
	Sat, 21 Mar 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="EpNn65rZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4728C035;
	Sat, 21 Mar 2026 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774099159; cv=pass; b=Aq6Fie7+/vnpPmwhfIcAq/eB0eFEAt+UMWb4s4CAvj9r71KKb34dX8/a7bwSpYM1HhgbEyDMp4r6kwMYnmOv4bsV8IAKTB20eU3HgkX7NjB1uKBlEMeHKFqU5iC+CrnqHvGQOeCVDcUZcX+Cvvwis0ksNuwneu4rgffzEnkE0NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774099159; c=relaxed/simple;
	bh=P0Yvqh2raOXoNJFWePXjbyyvV5t+M1TMaQ2WHKlF+5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZBc4JNUtEmYMJypt9cuent1evdvB+HgXvSWQA5zJWX2FZlqovcUW2e42+cZd5fjU3Ji3MJyW+ge+3JJdvT9q6l4PKxbo8XOaq5Lzog3h7Jpmd5gvxO6BNc+fvhG/TAS+zZArA9ALjVOyyNJ6dcM4+vO0XA3+WbH16rM/7GJKIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=EpNn65rZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774099153; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iCS7+K4FyhgIxUvwNQIejRobX0jHkOa/brI31nZvPTPqCyiZE3lG/PiiGuXFbQu1TTiJWZriqWBcwBDTushcFll59s1EeF56oWck7JfFhNLSDzDL7Of6Z6fwSLK/TcdTkZynd0hxhQoDXAGLMYQiwgbH7XZ88Kg5mG2yrrmmD7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774099153; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ATnz+CSeprBb3gSBT0vU5OuDoOhHiJoghIdXlUcebHg=; 
	b=Qc0SwgyayDGNHM1klwCvwVaKAOAGJXLObav9rt6qPpnCNxKvoDo5vGU93TKiXbTcG4K7rwgxxGrMHPJtTBjL1AZGRhpkP2+oXu9k76oIT3bgOTNdSwFFpCLHFWAkbfUJwa56KueBamdkvRD7PgAFJCahLh/c9y7XjmACrgmL6JQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774099153;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ATnz+CSeprBb3gSBT0vU5OuDoOhHiJoghIdXlUcebHg=;
	b=EpNn65rZDT/J3vZ+PqRSRrUE1IzPTKsTHNC0a20G946gR4usPDFMExd3fN2cgui1
	DUmQIkIvG/8OnGtsJ1UZ5hni5jlx7uP0ziSTMw/L1jSWC4p0MUPP5SoNmoeeRVKCsST
	vZWBEmr7lScov8tuQzZXVEyOjsYR464+ZQBsig6g=
Received: by mx.zohomail.com with SMTPS id 1774099150672308.9147440221511;
	Sat, 21 Mar 2026 06:19:10 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: rework footer with semantic markup and responsive layout
Date: Sat, 21 Mar 2026 09:18:57 -0400
Message-ID: <20260321131857.14166-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.36 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	MIME_HTML_ONLY(0.20)[];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80480-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:~];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ritovision.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_SPAM(0.00)[0.976];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sphinx-doc.org:url,alabaster.readthedocs.io:url,ritovision.com:dkim,ritovision.com:mid]
X-Rspamd-Queue-Id: A8EA02E5831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current Alabaster footer uses a generic `div` container, is
hidden entirely at the theme's small-screen breakpoint, and does
not provide a responsive layout for narrower viewports.

Rework the Alabaster footer to use semantic markup while
preserving its existing content, including the copyright notice,
theme attribution, and Page source link. Structure it with a
responsive flexbox so those items remain visible and orderly on
smaller screens.

Scope the change to Alabaster so other supported themes remain
unaffected.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/conf.py                      |  6 ++++
 Documentation/sphinx-static/custom.css     | 25 ++++++++++++++++
 Documentation/sphinx/templates/layout.html | 33 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/sphinx/templates/layout.html

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..7ad1db83e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -432,6 +432,12 @@ if html_theme == "alabaster":
 
 sys.stderr.write("Using %s theme\n" % html_theme)
 
+# Expose the active theme so local templates can avoid overriding
+# theme-specific markup for non-default HTML builds.
+html_context = {
+    "kernel_docs_theme": html_theme,
+}
+
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
 # so a file named "default.css" will overwrite the builtin "default.css".
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..dfe550adf 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -23,6 +23,31 @@ div.document {
     margin: 20px 10px 0 10px;
     width: auto;
 }
+/*
+ * Use a semantic footer that stays visible on small screens and wraps
+ * its content as needed.
+ */
+footer.footer {
+    max-width: 65em;
+    margin: 20px auto 30px auto;
+    padding: 0 15px 0 10px;
+    box-sizing: border-box;
+    font-size: 14px;
+    color: #888;
+}
+
+footer.footer a {
+    color: inherit;
+}
+
+footer.footer div.footer-inner {
+    display: flex;
+    justify-content: center;
+    align-items: center;
+    flex-wrap: wrap;
+    gap: 0.35em 0.6em;
+    text-align: center;
+}
 
 /* Size the logo appropriately */
 img.logo {
diff --git a/Documentation/sphinx/templates/layout.html b/Documentation/sphinx/templates/layout.html
new file mode 100644
index 000000000..52727cabc
--- /dev/null
+++ b/Documentation/sphinx/templates/layout.html
@@ -0,0 +1,33 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{%- extends "!layout.html" %}
+
+{%- block footer %}
+  {% if kernel_docs_theme == "alabaster" %}
+    <footer class="footer" role="contentinfo">
+      <div class="footer-inner">
+      {% if show_copyright %}
+        <span class="footer-item">&#169;{{ copyright }}.</span>
+      {% endif %}
+      {% if show_sphinx %}
+      {% if show_copyright %}
+        <span class="footer-sep" aria-hidden="true">|</span>
+      {% endif %}
+        <span class="footer-item">
+          Powered by <a href="https://www.sphinx-doc.org/">Sphinx {{ sphinx_version }}</a>
+          &amp; <a href="https://alabaster.readthedocs.io">Alabaster {{ alabaster_version }}</a>
+        </span>
+      {% endif %}
+      {%- if show_source and has_source and sourcename %}
+      {% if show_copyright or show_sphinx %}
+        <span class="footer-sep" aria-hidden="true">|</span>
+      {% endif %}
+        <a class="footer-item" href="{{ pathto('_sources/' + sourcename, resource=True)|e }}"
+           rel="nofollow">{{ _('Page source') }}</a>
+      {%- endif %}
+      </div>
+    </footer>
+  {% else %}
+    {{ super() }}
+  {% endif %}
+{%- endblock %}
-- 
2.51.0


