Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E572AFA85
	for <lists+linux-doc@lfdr.de>; Wed, 11 Nov 2020 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgKKVfO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Nov 2020 16:35:14 -0500
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172]:33535 "EHLO
        smtp-42ac.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727154AbgKKVex (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 16:34:53 -0500
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4CWdL304KkzlhKmV;
        Wed, 11 Nov 2020 22:34:51 +0100 (CET)
Received: from localhost (unknown [94.23.54.103])
        by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4CWdL25R2dzlh8T9;
        Wed, 11 Nov 2020 22:34:50 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     James Morris <jmorris@namei.org>, Jann Horn <jannh@google.com>,
        "Serge E . Hallyn" <serge@hallyn.com>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: [PATCH v1 5/9] landlock: Add extra checks when inserting a rule
Date:   Wed, 11 Nov 2020 22:34:38 +0100
Message-Id: <20201111213442.434639-6-mic@digikod.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111213442.434639-1-mic@digikod.net>
References: <20201111213442.434639-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make sure that there is always an (allocated) object in each used rules.
This could have prevented the bug fixed with a previous commit.

When the rules from a ruleset are merged in a domain with
landlock_enforce_ruleset_current(2), these new rules should be assigned
to the last layer.  However, when a rule is just extending a ruleset
with landlock_add_rule(2), the number of layers of this updated ruleset
should always be 0.  Checking such use of landlock_insert_rule() could
enable to detect bugs in future developments.

Replace the hardcoded 1 with SINGLE_DEPTH_NESTING.

Cc: James Morris <jmorris@namei.org>
Cc: Jann Horn <jannh@google.com>
Cc: Serge E. Hallyn <serge@hallyn.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/landlock/ruleset.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/security/landlock/ruleset.c b/security/landlock/ruleset.c
index 7654a66cea43..1fb85daeb750 100644
--- a/security/landlock/ruleset.c
+++ b/security/landlock/ruleset.c
@@ -102,6 +102,10 @@ int landlock_insert_rule(struct landlock_ruleset *const ruleset,
 
 	might_sleep();
 	lockdep_assert_held(&ruleset->lock);
+	if (WARN_ON_ONCE(!rule->object))
+		return -ENOENT;
+	if (!is_merge && WARN_ON_ONCE(ruleset->nb_layers != 0))
+		return -EINVAL;
 	walker_node = &(ruleset->root.rb_node);
 	while (*walker_node) {
 		struct landlock_rule *const this = rb_entry(*walker_node,
@@ -223,12 +227,7 @@ static struct landlock_ruleset *inherit_ruleset(
 		return new_ruleset;
 
 	mutex_lock(&new_ruleset->lock);
-	mutex_lock_nested(&parent->lock, 1);
-	new_ruleset->nb_layers = parent->nb_layers;
-	new_ruleset->fs_access_mask = parent->fs_access_mask;
-	WARN_ON_ONCE(!parent->hierarchy);
-	get_hierarchy(parent->hierarchy);
-	new_ruleset->hierarchy->parent = parent->hierarchy;
+	mutex_lock_nested(&parent->lock, SINGLE_DEPTH_NESTING);
 
 	/* Copies the @parent tree. */
 	rbtree_postorder_for_each_entry_safe(walker_rule, next_rule,
@@ -237,6 +236,12 @@ static struct landlock_ruleset *inherit_ruleset(
 		if (err)
 			goto out_unlock;
 	}
+	new_ruleset->nb_layers = parent->nb_layers;
+	new_ruleset->fs_access_mask = parent->fs_access_mask;
+	WARN_ON_ONCE(!parent->hierarchy);
+	get_hierarchy(parent->hierarchy);
+	new_ruleset->hierarchy->parent = parent->hierarchy;
+
 	mutex_unlock(&parent->lock);
 	mutex_unlock(&new_ruleset->lock);
 	return new_ruleset;
-- 
2.29.2

