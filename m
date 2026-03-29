Return-Path: <linux-doc+bounces-81647-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGLrG2NDyWkswwUAu9opvQ
	(envelope-from <linux-doc+bounces-81647-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 17:21:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60C3528DB
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 17:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C335A300D91F
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 15:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AF830DECE;
	Sun, 29 Mar 2026 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="VLU8CK8N"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794A20B810;
	Sun, 29 Mar 2026 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797664; cv=pass; b=Ef4qu0DFjcGaUtE3gvwSlx3R2DM9tsTh/pZveEjvSYpORNjTnbYotsCx+cprVuAShSDXhGQFSU9l3PV2vGGUWmgWIj1T+kwPHO+tnRv6ezR9n0b8kXpKV/K1pXAKDj16cXUX19Hr0HIJl1fdaanNgMHRhCfd0aKpHKZK+i4eEJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797664; c=relaxed/simple;
	bh=adwPQv6MQ9dB6vSRtid76Q8ZaFeUIPL17w8pY96QGRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JKIrVaLvCQo0rKXJ+QYoPlUzNiUwjD8td6y3dj6d4TpR5NSZ/H+4UAioNOg4MItwjUbBbf6qqcQbWtG6cQbrVUQ83Kn3q9lHSS7A/rqD6IXJy/zzZHu0zlXHlnBotReT5X28jC0BcHUrTmDPFV9Sg3vYnVBur2ljP/LGXCZp90w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=VLU8CK8N; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774797655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F9ZQMMR2LAnSMiUtS0lXug7Il4oUDd8iR5Va0mJ3mTX01N+tEY6+PRW3fckuua/f/8Hc2zWnICu0qXo9tQ8LaPtZkoPktIX4FA86haHJ4mF91dFwDxzFYWjP+ZvachfzQkQm1/iihjc6OazfgjeqQgbKw6R1HsLNwUGRTuKpD+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774797655; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dh1KD1kIwHt5kATHQ1FaRdhBrkYRMz6eA7qeEe1vYxk=; 
	b=l+7pbzoX4l9fr6nMUJ/qYOj0dOmmAXdFIbcxILRkH1gGNRSZHrsAsgMnR62RM6YS7elVfAtJOTTasWtVzxgj+IXxCZtxSrSwzZ7fKvfPUTTGwEhurJko148ubdymq8cKEQShKrkjYyBvgyOxYCWV6igzUiN1FdceOcQsVqLXjwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774797655;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dh1KD1kIwHt5kATHQ1FaRdhBrkYRMz6eA7qeEe1vYxk=;
	b=VLU8CK8NAhz90ofjDc85WXINSLys3TuNfN9GKjpTS2vlkbOZpqwzP9tjTN/IiYbi
	Z3AIv7E2m1gobzJJd2t4XpWsiNfcH8df11JuFiISR8aVFrgc2eju6V3u/oJo459MZje
	CN5POj46Jv9PG/f7lDApoY04Gjy/ziWgGNH5xqEc=
Received: by mx.zohomail.com with SMTPS id 1774797651996588.7546701630544;
	Sun, 29 Mar 2026 08:20:51 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: generate a static 404 page
Date: Sun, 29 Mar 2026 11:20:46 -0400
Message-ID: <20260329152047.5736-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81647-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE60C3528DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Broken links in static deployments currently fall back to a
generic web server 404 page, which leaves users on an orphaned
error page with no direct way to continue navigating the
documentation site. Add a dedicated not-found page so deployments
can serve a project-specific 404 instead.

It keeps the normal documentation layout around the error state so
users still have the search box, table of contents, footer links,
and a clear route back to the documentation root. The penguin
logo makes it less generic and adds character to what is
otherwise a frustrating page to encounter.

Actual 404 handling remains a web server concern.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
For 404 handling to work in nginx, the generated page must be
enabled there as well: point the site root at the built
documentation tree, then use error_page 404 /404.html;
together with a standard try_files $uri $uri/ =404;
location block.

I've tested the setup locally with nginx and it works fine.

These screenshots show the generated 404 page being served live in
Chrome on desktop and mobile.

Desktop screenshot:
https://github.com/user-attachments/assets/085eff0b-8661-4919-a651-6109e505ff05

Mobile screenshot:
https://github.com/user-attachments/assets/85a171f7-c2ff-483d-bc35-6719202a70e1

The screenshots above are hosted in a GitHub issue. For
convenience, anyone is welcome to post additional screenshots
there and reference them from the mailing list for discussion of
this patch:
https://github.com/ritovision/linux-kernel-docs/issues/4

 Documentation/conf.py                   |  6 +++
 Documentation/sphinx-static/custom.css  | 69 +++++++++++++++++++++++++
 Documentation/sphinx/templates/404.html | 16 ++++++
 3 files changed, 91 insertions(+)
 create mode 100644 Documentation/sphinx/templates/404.html

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..e315a68e0 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -437,6 +437,12 @@ sys.stderr.write("Using %s theme\n" % html_theme)
 # so a file named "default.css" will overwrite the builtin "default.css".
 html_static_path = ["sphinx-static"]
 
+# Generate a simple static 404 page. Serving it for missing paths is left to
+# the front-end web server configuration.
+html_additional_pages = {
+    "404": "404.html",
+}
+
 # If true, Docutils "smart quotes" will be used to convert quotes and dashes
 # to typographically correct entities.  However, conversion of "--" to "—"
 # is not always what we want, so enable only quotes.
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..c4d28e1d4 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,72 @@ a.manpage {
 	font-weight: bold;
 	font-family: "Courier New", Courier, monospace;
 }
+
+/* Center the 404 body copy without affecting normal pages.
+ * This minimum height ensures the footer remains positioned
+ * visibly at the bottom of the page despite most of the page
+ * being empty.
+ * 100% width allows for contained centering of inner contents */
+div.kernel-404-page {
+    align-items: center;
+    box-sizing: border-box;
+    display: flex;
+    justify-content: center;
+    min-height: 90vh;
+    padding: 2rem 1rem;
+    width: 100%;
+}
+
+/* Group the content as a vertical stack */
+div.kernel-404-content {
+    display: flex;
+    flex-direction: column;
+    gap: 0.75rem;
+    max-width: 28rem;
+}
+
+a.kernel-404-logo-link {
+    align-self: stretch;
+    border-bottom: none;
+}
+
+a.kernel-404-logo-link:hover {
+    border-bottom: none;
+}
+
+img.kernel-404-logo {
+    display: block;
+    height: auto;
+    margin-inline: auto;
+}
+
+div.kernel-404-content h1,
+div.kernel-404-content p {
+    margin: 0;
+}
+
+/* Make the header larger and more prominent. */
+div.kernel-404-content h1 {
+    font-size: 300%;
+}
+
+p.kernel-404-home {
+    margin-top: 0.5rem;
+    text-align: center;
+}
+
+@media screen and (max-width: 65em) {
+    /* Less viewport height because the mobile sidebar is taking
+     * up large chunk of the screen already */
+    div.kernel-404-page {
+        min-height: 40vh;
+    }
+
+    img.kernel-404-logo {
+        width: 70%;
+    }
+
+    div.kernel-404-content h1 {
+        font-size: 240%;
+    }
+}
diff --git a/Documentation/sphinx/templates/404.html b/Documentation/sphinx/templates/404.html
new file mode 100644
index 000000000..3a8a15f49
--- /dev/null
+++ b/Documentation/sphinx/templates/404.html
@@ -0,0 +1,16 @@
+{# SPDX-License-Identifier: GPL-2.0-only #}
+{% extends "layout.html" %}
+{% set title = "404 Not Found" %}
+
+{% block body %}
+  <div class="kernel-404-page">
+    <div class="kernel-404-content">
+      <a class="kernel-404-logo-link" href="{{ pathto(master_doc) }}" aria-label="Return home">
+        <img class="kernel-404-logo" src="{{ pathto('_static/logo.svg', 1) }}" alt="" />
+      </a>
+      <h1>404 Not Found</h1>
+      <p>The page you are searching for doesn't exist.</p>
+      <p class="kernel-404-home"><a href="{{ pathto(master_doc) }}">Return home</a></p>
+    </div>
+  </div>
+{% endblock %}
-- 
2.51.0


